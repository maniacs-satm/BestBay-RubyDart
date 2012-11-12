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

class Watchlist < ActiveRecord::Base
  attr_accessible :product_id, :user_id
  belongs_to :product
  belongs_to :user
end
