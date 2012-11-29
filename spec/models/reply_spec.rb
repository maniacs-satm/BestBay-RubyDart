# == Schema Information
#
# Table name: replies
#
#  id         :integer          not null, primary key
#  content    :string(255)
#  user_id    :integer
#  review_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'spec_helper'

describe Reply do

  before do
    @reply = FactoryGirl.create(:reply)
  end

  subject { @reply }

  it { should respond_to(:content) }
  it { should respond_to(:user_id) }
  it { should respond_to(:review_id) }
  it { should be_valid }

  describe "when content is not present" do
    before { @reply.content = nil }
    it { should_not be_valid }
  end

  describe "when user_id is not present" do
    before { @reply.user_id = nil }
    it { should_not be_valid }
  end

  describe "when review_id is not present" do
    before { @reply.review_id = nil }
    it { should_not be_valid }
  end
end
