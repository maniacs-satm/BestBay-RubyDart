# == Schema Information
#
# Table name: watchlists
#
#  id         :integer          not null, primary key
#  product_id :integer
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'spec_helper'

describe Watchlist do
  it { should respond_to(:user_id) }
  it { should respond_to(:product_id) }
end
