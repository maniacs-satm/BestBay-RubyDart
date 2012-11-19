# == Schema Information
#
# Table name: reviews
#
#  id           :integer          not null, primary key
#  content      :string(255)
#  from_user_id :integer
#  to_user_id   :integer
#  product_id   :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

require 'spec_helper'

describe Review do
  
  before do
    @review = FactoryGirl.create(:review)
  end

  subject { @review }

  it { should respond_to(:content) }
  it { should respond_to(:from_user_id) }
  it { should respond_to(:to_user_id) }
  it { should respond_to(:product_id) }
  it { should be_valid }

  describe "when content is not present" do
    before { @review.content = nil }
    it { should_not be_valid }
  end

  describe "when from_user_id is not present" do
    before { @review.from_user_id = nil }
    it { should_not be_valid }
  end

  describe "when to_user_id is not present" do
    before { @review.to_user_id = nil }
    it { should_not be_valid }
  end

  describe "when product_id is not present" do
    before { @review.product_id = nil }
    it { should_not be_valid }
  end
  
end
