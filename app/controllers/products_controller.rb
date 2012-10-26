class ProductsController < ApplicationController
  # GET /products
  # GET /products.json
  def index
    if signed_in?
      @products = current_user.products
      @search = Hash.new
      respond_to do |format|
        format.html # index.html.erb
        format.json { render json: @products }
      end
    else
      redirect_to root_url
    end
  end

  # GET /products/1
  # GET /products/1.json
  def show
    @product = Product.find(params[:id])
    @productOwner = User.find(@product.user_id)
    @bid = Bid.new
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @product }
    end
  end

  # GET /products/new
  # GET /products/new.json
  def new
    @product = Product.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @product }
    end
  end

  # GET /products/1/edit
  def edit
    @product = Product.find(params[:id])
  end

  # POST /products
  # POST /products.json
  def create
    if signed_in?
      @product = current_user.products.build(params[:product])
      @product.current_price = @product.start_price;
      @product.user_name = current_user.name
   


      respond_to do |format|
        if @product.save
          flash[:success] = 'Success Post a Product on BestBay!'
          format.html redirect_to @product
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

  # PUT /products/1
  # PUT /products/1.json
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

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product = Product.find(params[:id])
    #TODO: should check product id here.
    @product.destroy

    respond_to do |format|
      format.html { redirect_to products_url }
      format.json { head :no_content }
    end
  end

  def search
    q = params[:query]

    if q
      all = current_user.products
      if !all.empty?
        @products = Array.new
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
