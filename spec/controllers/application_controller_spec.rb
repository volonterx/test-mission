require 'spec_helper'

describe ApplicationController do
  describe "after sign in path" do
      
    before (:each) do
      @user = FactoryGirl.create :user
      sign_in @user
    end
    
    it "redirects to the /welcome page if user does not complite registration" do
      controller.current_user.stub!(:is_complited_registration?).and_return(false)
      controller.after_sign_in_path_for(controller.current_user).should eq(welcome_index_path)
    end

    it "redirects to the /dashboard page if user complited registration" do
      controller.current_user.stub!(:is_complited_registration?).and_return(true)
      controller.after_sign_in_path_for(controller.current_user).should eq(dashboard_index_path)
    end
  end
end