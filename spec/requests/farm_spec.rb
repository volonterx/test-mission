require 'spec_helper'

describe 'New farm page' do

  context 'when user does not authorized' do
    specify 'should show sign in page' do
      visit '/farms/new'
      page.should have_content 'Sign in'
    end
  end


  context 'when user authorized' do
    before(:each) do
      @user = FactoryGirl.create :user 
      visit '/users/sign_in'
      fill_in "Email", :with => @user.email
      fill_in "Password", :with => @user.password
      click_button "Sign in"
      visit '/farms/new'
    end

    specify 'should show new farm page' do
      page.should have_content 'New farm'
    end

    specify 'should create valid farm' do
      farm = FactoryGirl.attributes_for(:farm)
      fill_in "Title", :with => farm[:title]
      click_button 'Create Farm'
      page.should have_content 'Farm created'
    end

    specify 'should not create invalid farm' do
      farm = FactoryGirl.attributes_for(:farm)
      click_button 'Create Farm'
      page.should have_content "can't be blank"
    end
  end

end
