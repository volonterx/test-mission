require 'spec_helper'

describe WelcomeController do

  before(:each) do
    @user = FactoryGirl.create :user 
    sign_in @user
  end

  describe "GET #index" do
    it "should render index if user login in" do
      get 'index'
      response.should render_template :index
    end
  end

end
