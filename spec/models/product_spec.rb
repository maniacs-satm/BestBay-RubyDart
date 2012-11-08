require 'spec_helper'

describe Product do

    before do
      @product = Product.new(title: 'Sample Product', start_price:90.00,
                       description: 'hello world!', time_left: 100, user_id:1,
                       current_price:0.00, category_id: 1)
    end

    subject { @product }

    # test columns
    it { should respond_to(:title) }
    it { should respond_to(:start_price) }
    it { should respond_to(:description) }
    it { should respond_to(:time_left) }
    it { should respond_to(:current_price) }
    it { should respond_to(:user_id)}

    it { should be_valid }

    describe "when title is not present" do
      before { @product.title = " " }
      it { should_not be_valid }
    end

    describe "when title is too long" do
      before { @product.title = 'a' * 201 }
      it { should_not be_valid }
    end

    describe "when user_id is not present" do
      before { @product.user_id = '' }
      it { should_not be_valid }
    end

    describe "when category_id is not present" do
      before { @product.category_id = '' }
      it { should_not be_valid }
    end

    describe "when start_price is not present" do
      before { @product.start_price = '' }
      it { should_not be_valid }
    end
  end