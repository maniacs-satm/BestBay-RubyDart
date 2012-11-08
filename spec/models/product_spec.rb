# == Schema Information
#
# Table name: products
#
#  id                 :integer          not null, primary key
#  title              :string(255)
#  start_price        :float
#  description        :string(255)
#  user_id            :integer
#  time_left          :integer
#  current_price      :float
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  image_file_name    :string(255)
#  image_content_type :string(255)
#  image_file_size    :integer
#  user_name          :string(255)
#  category_id        :integer
#

require 'spec_helper'

describe Product do

    before do
      @product = FactoryGirl.create(:product)
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

    describe "when user is not present" do
      before { @product.user_id = ' ' }
      it { should_not be_valid }
    end

  end
