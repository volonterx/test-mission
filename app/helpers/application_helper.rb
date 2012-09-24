module ApplicationHelper
  def navigation
    if user_signed_in?
      s = ""
      s += link_to "Welcome", welcome_index_path unless current_user.is_complited_registration?
      s += " | "
      s += link_to "Sign out", destroy_user_session_path, method: :delete 
      s.html_safe
    end
  end

  def is_profile_created?
    "Done" unless current_user.profile.nil? 
  end
end
