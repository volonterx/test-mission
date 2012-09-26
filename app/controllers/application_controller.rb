class ApplicationController < ActionController::Base
  protect_from_forgery

  def after_sign_in_path_for(resource_or_scope)
    current_user.show_welcome_page? ? dashboard_index_path : welcome_index_path
  end
end
