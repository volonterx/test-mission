require 'spec_helper'

describe FarmsController do

  let(:user) { create :user } 
  before { sign_in user }

  describe "#new" do 
    before { get :new }
    it { assigns :farm } 
    it { should render_template :new }
  end

  describe "#create with valid farm" do
    before { post :create, farm: FactoryGirl.attributes_for(:farm) }
    it { assigns :farm }
    it { should set_the_flash.to("Farm created") } 
    it { should redirect_to(welcome_index_path) }
  end

  describe "#create with invalid farm" do
    before { post :create, farm: FactoryGirl.attributes_for(:farm, title: "") }
    it { assigns :farm }
    it { should_not set_the_flash } 
    it { should render_template :new }
  end

end