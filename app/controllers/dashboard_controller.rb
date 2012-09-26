class DashboardController < ApplicationController
  before_filter :authenticate_user!, :current_user_is_complited_registration
  
  def index
  end

private
  
  def current_user_is_complited_registration
    redirect_to welcome_index_path, notice: flash[:notice] unless current_user.show_welcome_page?
  end
end
