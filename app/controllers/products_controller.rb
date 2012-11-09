##
# This is the controller of the model of products. All features and methods relates to products is listed here.
#
#
class ProductsController < ApplicationController
  # This method will display all products created on the website
  # It requires the user to log in
  #
  # * *Handles* :
  #   - GET /products
  # * *Redirects* :
  #   - root_url(home page) -> if the user has not signed in yet
  # * *Renders* :
  #   - a list view of all products -> if the user has signed in already
  #
  def index
    if signed_in?
      @products =Product.all
      @products.each do |p|
        p[:time_left] = (Date.strptime(p.bid_until, '%m/%d/%Y')-Date.today).to_i/1.day 
      end

      #@products.sort_by!{|a, b| a[:id] <=> b[:id]}
      @search = Hash.new
      if params[:category_id] != nil
        @category = Category.find(params[:category_id])
      else
        @category = Category.find(1)
      end
      respond_to do |format|
        format.html # index.html.erb
        format.json { render json: @products }
      end
    else
      redirect_to root_url
    end
  end

  # This method collects all products created by the current signed in user
  # * *Handles* :
  #   - when users click "my product list" under the draw down menu in header
  # * *Renders* :
  #   - a list view of the products created by the current user+ -> if the user has signed in already
  # * *Redirects* :
  #   - root_url(home page) -> if the user has not signed in yet
  def list_my_products
    if signed_in?
      @products = Product.find(:all, :conditions => { :user_id => current_user.id} )
      @search = Hash.new
      render 'list_my_products'
    else
      redirect_to root_url
    end
  end

  # Showing a view of single product and allows user to bid on it.
  # We do not expect user to type the id manually. User click on an item on the procut list and to be redirect to this.
  # * *Handles* :
  #   - GET /products/:id
  #   - GET /products/:id.json
  # * *Renders* :
  #   - a view of the product corresponding to id with every attributes of the product
  #   - allows user to bid on it
  # * *Raises* :
  #   - +SQLException+ -> if :id if not valid.
  def show
    @product = Product.find(params[:id])
    @productOwner = User.find(@product.user_id)
    @bid = Bid.new
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @product }
    end
  end

  # Creates a new product with empty attributes.
  # * *Handles* :
  #   - GET /products/new
  #   - GET /products/new.json
  def new
    @product = Product.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @product }
    end
  end

  # Edit properties of the product corresponding with the id. 
  # Not all the properties is editable. 
  # * *Renders* :
  #   - +product_edit.html+ -> a form view to edit different attributes
  # * *Handles* :
  #   - GET /products/:id/edit
  # * *Editables* :
  #   - title
  #   - description
  #   - image
  #   - catagory
  # * *Raises* :
  #   - +SQLException+ -> if :id if not valid.
  def edit
    @product = Product.find(params[:id])
  end

  # Create a new product with attributes typed in
  # This requires user to log in
  # * *Handles* :
  #   - POST /products
  #   - POST /products.json
  # * *Redirects* :
  #   - product_url(show page) -> if the product is created successfully
  #   - stays in the same page -> if the product is unable to created
  def create
    if signed_in?
      @product = current_user.products.build(params[:product])
      @product.user_id = current_user.id
      @product.current_price = @product.start_price;
      @product.user_name = current_user.name

      respond_to do |format|
        if @product.save
          flash[:success] = 'Success Post a Product on BestBay!'
          format.html {redirect_to products_url}
          format.json { render json: @product, status: :created, location: @product }
        else
          flash[notice] = 'Unable to Post a Product on BestBay!'
          format.html { render action: "new" }
          format.json { render json: @product.errors, status: :unprocessable_entity }
        end
      end
    else
      redirect_to root_url
    end
  end

  # Update information of a product
  # * *Handles* :
  #   - PUT /products/1
  #   - PUT /products/1.json
  # * *Redirects* :
  #   - product_url(show page) -> if the product is updated successfully
  #   - stays in the same page -> if the product is unable to updated
  def update
    @product = Product.find(params[:id])

    respond_to do |format|
      if @product.update_attributes(params[:product])
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # Delete a product
  # Do not render any pages
  # * *Handles* :
  #   - DELETE /products/1
  #   - DELETE /products/1.json
  def destroy
    @product = Product.find(params[:id])
    #TODO: should check product id here.
    @product.destroy

    respond_to do |format|
      format.html { redirect_to products_url }
      format.json { head :no_content }
    end
  end
 # Search for a product
  # * *Handles* :
  #   - Post /search-product
  # * *Renders* :
  #   - products/index -> if find the item
  #
  def search
    q = params[:query]
    @products = Array.new

    if q
      all = Product.all
      if !all.empty?
        all.each do |p|
          if p[:description] =~ /#{q}/i
            @products << p
          end
        end
      end
    end
    render 'index'
  end

end
