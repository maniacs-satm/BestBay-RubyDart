# == Schema Information
#
# Table name: administrators
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  status     :boolean
#  admin      :boolean
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'spec_helper'

describe Administrator do
  
  before do
    @administrator = FactoryGirl.create(:administrator)
  end

  subject { @administrator }

  it { should respond_to(:user_id) }
  it { should respond_to(:admin) }
  it { should respond_to(:status) }
  it { should be_valid }

  describe "when user_id is not present" do
    before { @administrator.user_id = nil }
    it { should_not be_valid }
  end

  describe "when admin is not present" do
    before { @administrator.admin = nil }
    it { should_not be_valid }
  end

  describe "when status is not present" do
    before { @administrator.status = nil }
    it { should_not be_valid }
  end
  
end

