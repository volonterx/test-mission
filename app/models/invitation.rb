class Invitation < ActiveRecord::Base
  attr_accessible :invitee_id

  validates :invitee_id, presence: :true

  belongs_to :user
  belongs_to :invitee, class_name: 'User'

end
