class InvitationsController < WelcomeController

  def new
    @invitation = current_user.invitations.build
  end

  def create
    @invitation = current_user.invitations.build(params[:invitation])
    if @invitation.save
      redirect_to dashboard_index_path, notice: "Invitation created"
    else
      render action: :new
    end
  end
end
