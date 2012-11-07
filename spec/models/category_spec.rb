# == Schema Information
#
# Table name: categories
#
#  id         :integer          not null, primary key
#  content    :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'spec_helper'

describe Category do
  it {should respond_to(:content)}
  it {should respond_to(:product_id)}
end
