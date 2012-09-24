class ProfilesController < WelcomeController

  def new
    @profile = current_user.build_profile
  end

  def create
    @profile = current_user.build_profile(params[:profile])
    if @profile.save
      redirect_to dashboard_index_path, notice: "Profile created"
    else
      render action: :new
    end
  end
end
