require 'spec_helper'

describe 'Home' do

  def sign_in_as user
    fill_in "Email", :with => user.email
    fill_in "Password", :with => user.password
    click_button "Sign in"
  end

  before(:each) do
    @new_user = FactoryGirl.create :user 
  end

  specify 'should show sign in page if user does not authorized' do
    visit '/'
    page.should have_content 'Sign in'
  end

  specify 'should show welcome page if user authorized and does not fulfilled welcome conditions' do
    visit '/'
    sign_in_as @new_user
    page.should have_link 'Welcome'
  end

  specify 'should show dashboard page if user authorized and fulfilled welcome conditions' do
    @user = FactoryGirl.create :user, email: "user@example.com" 
    FactoryGirl.create :farm, user: @user 
    FactoryGirl.create :invitation, user: @user 
    FactoryGirl.create :profile, user: @user 
    visit '/'
    sign_in_as @user
    page.should have_content 'Dashboard'
    page.should_not have_link 'Welcome'
  end

end
