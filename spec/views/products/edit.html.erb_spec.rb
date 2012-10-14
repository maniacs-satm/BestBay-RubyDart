require 'spec_helper'

describe "products/edit" do
  before(:each) do
    @product = assign(:product, stub_model(Product,
      :title => "MyString",
      :start_price => "",
      :description => "MyString",
      :owner_id => 1,
      :time_left => "MyString",
      :integer => "MyString",
      :current_price => ""
    ))
  end

  it "renders the edit product form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => products_path(@product), :method => "post" do
      assert_select "input#product_title", :name => "product[title]"
      assert_select "input#product_start_price", :name => "product[start_price]"
      assert_select "input#product_description", :name => "product[description]"
      assert_select "input#product_owner_id", :name => "product[owner_id]"
      assert_select "input#product_time_left", :name => "product[time_left]"
      assert_select "input#product_integer", :name => "product[integer]"
      assert_select "input#product_current_price", :name => "product[current_price]"
    end
  end
end
