require 'spec_helper'

describe InvitationsController do

  let(:user) { create :user } 
  before { sign_in user }

  describe "#new" do 
    before { get :new }
    it { assigns :invitation } 
    it { should render_template :new }
  end

  describe "#create with valid invitation" do
    before { post :create, invitation: FactoryGirl.attributes_for(:invitation) }
    it { assigns :invitation }
    it { should set_the_flash.to("Invitation created") } 
    it { should redirect_to(welcome_index_path) }
  end

  describe "#create with invalid invitation" do
    before { post :create, invitation: FactoryGirl.attributes_for(:invitation, invitee_id: "") }
    it { assigns :invitation }
    it { should_not set_the_flash } 
    it { should render_template :new }
  end

end