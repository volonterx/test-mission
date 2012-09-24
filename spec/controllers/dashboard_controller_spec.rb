require 'spec_helper'

describe DashboardController do

  before(:each) do
    @user = FactoryGirl.create :user 
    sign_in @user
    controller.current_user.stub!(:is_complited_registration?).and_return(true)
  end

  describe "GET #index" do
    it "should render index if user login in after complite registration" do
      get 'index'
      response.should render_template :index
    end
  end

  describe "#current_user_is_complited_registration" do
    it "redirects to the /welcome page with notice if user does not complite registration" do
      notice = flash[:notice]
      controller.current_user.stub!(:is_complited_registration?).and_return(false)
      get :index
      flash[:notice].should eq(notice)
      response.should redirect_to(welcome_index_path)
    end

  end

end
