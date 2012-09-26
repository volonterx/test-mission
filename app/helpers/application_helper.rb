module ApplicationHelper

  def is_profile_created?
    "Done" if current_user.profile
  end

  def is_farm_created?
    "Done" if current_user.farms.any?
  end

  def is_invitation_was_sent?
    "Done" if current_user.invitations.any?
  end


end
