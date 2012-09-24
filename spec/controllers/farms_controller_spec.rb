require 'spec_helper'

describe FarmsController do
  it "should inherit from WelcomeController" do
    controller.class.superclass.to_s.should eq("WelcomeController")
  end
end

describe FarmsController, "GET #new" do

  before(:each) do
    @user = FactoryGirl.create :user 
    sign_in @user
    get 'new'
  end

  it "should create new farm for current user" do
    assigns(:farm).should be_new_record
    assigns(:farm).user.should eq(@user)
  end

  it "should render template :new" do
    response.should render_template :new
  end

end

describe FarmsController, "POST #create" do

  before(:each) do
    @user = FactoryGirl.create :user 
    sign_in @user
  end

  it "should save new valid farm for current user and redirect to dashboard page with notice" do
    post 'create', farm: FactoryGirl.attributes_for(:farm)
    assigns(:farm).user.should eq(@user)
    assigns(:farm).should_not be_new_record
    flash[:notice].should eq "Farm created"
    response.should redirect_to(dashboard_index_path)
  end

  it "should not save invalid farm for current user and render action :new" do
    post 'create', farm: FactoryGirl.attributes_for(:farm, title: "")
    assigns(:farm).should be_new_record
    flash[:notice].should be_nil
    response.should render_template :new
  end
end
