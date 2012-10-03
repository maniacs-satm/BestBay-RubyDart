require 'spec_helper'

describe "products/index" do
  before(:each) do
    assign(:products, [
      stub_model(Product,
        :title => "Title",
        :start_price => "",
        :description => "Description",
        :owner_id => 1,
        :time_left => "Time Left",
        :integer => "Integer",
        :current_price => ""
      ),
      stub_model(Product,
        :title => "Title",
        :start_price => "",
        :description => "Description",
        :owner_id => 1,
        :time_left => "Time Left",
        :integer => "Integer",
        :current_price => ""
      )
    ])
  end

  it "renders a list of products" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "Description".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Time Left".to_s, :count => 2
    assert_select "tr>td", :text => "Integer".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
  end
end
