require 'spec_helper'

describe ProfilesController do

  let(:user) { create :user } 
  before { sign_in user }

  describe "#new" do 
    before { get :new }
    it { assigns :profile } 
    it { should render_template :new }
  end

  describe "#create with valid profile" do
    before { post :create, profile: FactoryGirl.attributes_for(:profile) }
    it { assigns :profile }
    it { should set_the_flash.to("Profile created") } 
    it { should redirect_to(welcome_index_path) }
  end

  describe "#create with invalid profile" do
    before { post :create, profile: FactoryGirl.attributes_for(:profile, country: "") }
    it { assigns :profile }
    it { should_not set_the_flash } 
    it { should render_template :new }
  end

end

