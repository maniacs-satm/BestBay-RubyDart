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

class Review < ActiveRecord::Base
  attr_accessible :content, :user_id, :product_id

  validates :content,      presence: true
  validates :user_id,      presence: true
  validates :product_id,   presence: true

end
