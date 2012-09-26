class FarmsController < ApplicationController
  before_filter :authenticate_user!

  def new
    @farm = current_user.farms.build
  end

  def create
    @farm = current_user.farms.build(params[:farm])
    if @farm.save
      redirect_to welcome_index_path, notice: "Farm created"
    else
      render action: :new
    end
  end
end
