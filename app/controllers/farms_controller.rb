class FarmsController < WelcomeController
  def new
    @farm = current_user.farms.build
  end

  def create
    @farm = current_user.farms.build(params[:farm])
    if @farm.save
      redirect_to dashboard_index_path, notice: "Farm created"
    else
      render action: :new
    end
  end
end
