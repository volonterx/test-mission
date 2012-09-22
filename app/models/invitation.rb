class Invitation < ActiveRecord::Base
  # attr_accessible :title, :body

  belongs_to :user
  belongs_to :invitee, class_name: 'User'

end
