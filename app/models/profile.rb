class Profile < ActiveRecord::Base
   attr_accessible :country, :dob

   validates :country, presence: true
   validates :dob, presence: true

  belongs_to :user
end
