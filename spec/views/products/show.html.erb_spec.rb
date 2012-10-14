require 'spec_helper'

describe "products/show" do
  before(:each) do
    @product = assign(:product, stub_model(Product,
      :title => "Title",
      :start_price => "",
      :description => "Description",
      :owner_id => 1,
      :time_left => "Time Left",
      :integer => "Integer",
      :current_price => ""
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Title/)
    rendered.should match(//)
    rendered.should match(/Description/)
    rendered.should match(/1/)
    rendered.should match(/Time Left/)
    rendered.should match(/Integer/)
    rendered.should match(//)
  end
end
