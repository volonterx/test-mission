require 'spec_helper'

describe ProfilesController do
  it "should inherit from WelcomeController" do
    controller.class.superclass.to_s.should eq("WelcomeController")
  end
end

describe ProfilesController, "GET #new" do

  before(:each) do
    @user = FactoryGirl.create :user 
    sign_in @user
    get 'new'
  end

  it "should create new profile for current user" do
    assigns(:profile).should be_new_record
    assigns(:profile).user.should eq(@user)
  end

  it "should render template :new" do
    response.should render_template :new
  end


end

describe ProfilesController, "POST #create" do

  before(:each) do
    @user = FactoryGirl.create :user 
    sign_in @user
  end

  it "should save new valid profile for current user and redirect to dashboard page with notice" do
    post 'create', profile: FactoryGirl.attributes_for(:profile)
    assigns(:profile).user.should eq(@user)
    assigns(:profile).should_not be_new_record
    flash[:notice].should eq "Profile created"
    response.should redirect_to(dashboard_index_path)
  end

  it "should not save invalid profile for current user and render action :new" do
    post 'create', profile: FactoryGirl.attributes_for(:profile, country: "")
    assigns(:profile).should be_new_record
    flash[:notice].should be_nil
    response.should render_template :new
  end

end
