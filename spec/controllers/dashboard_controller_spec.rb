require 'spec_helper'

describe DashboardController do

  before(:each) do
    @user = FactoryGirl.create :user 
    sign_in @user
  end

  describe "GET #index" do
    it "should render index after user login" do
      get 'index'
      response.should render_template :index
    end
  end

end
