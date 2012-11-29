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

class Reply < ActiveRecord::Base
  attr_accessible :content, :review_id, :user_id

  validates :content,   presence: true
  validates :user_id,   presence: true
  validates :review_id, presence: true
end
