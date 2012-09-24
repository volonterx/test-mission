require 'spec_helper'

describe InvitationsController do
  it "should inherit from WelcomeController" do
    controller.class.superclass.to_s.should eq("WelcomeController")
  end
end

describe InvitationsController, "GET #new" do

  before(:each) do
    @user = FactoryGirl.create :user 
    sign_in @user
    get 'new'
  end

  it "should create new invitation for current user" do
    assigns(:invitation).should be_new_record
    assigns(:invitation).user.should eq(@user)
  end

  it "should render template :new" do
    response.should render_template :new
  end

end

describe InvitationsController, "POST #create" do

  before(:each) do
    @user = FactoryGirl.create :user 
    sign_in @user
  end

  it "should save new valid invitation for current user and redirect to dashboard page with notice" do
    post 'create', invitation: FactoryGirl.attributes_for(:invitation)
    assigns(:invitation).user.should eq(@user)
    assigns(:invitation).should_not be_new_record
    flash[:notice].should eq "Invitation created"
    response.should redirect_to(dashboard_index_path)
  end

  it "should not save invalid invitation for current user and render action :new" do
    post 'create', invitation: FactoryGirl.attributes_for(:invitation, invitee_id: "")
    assigns(:invitation).should be_new_record
    flash[:notice].should be_nil
    response.should render_template :new
  end
end
