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

class Administrator < ActiveRecord::Base
  attr_accessible :admin, :status, :user_id

  validates :user_id, presence: true
  validates_inclusion_of :admin, :in => [true, false]  
  validates_inclusion_of :status, :in => [true, false]  

end
