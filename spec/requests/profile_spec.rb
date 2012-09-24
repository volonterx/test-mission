require 'spec_helper'

describe 'New profile page' do

  context 'when user does not authorized' do
    specify 'should show sign in page' do
      visit '/profiles/new'
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
      visit '/profiles/new'
    end

    specify 'should show new profile page' do
      page.should have_content 'Profile'
    end

    specify 'should create valid profile' do
      profile = FactoryGirl.attributes_for(:profile)
      fill_in "Country", :with => profile[:country]
      select profile[:dob].year.to_s, from: "profile[dob(1i)]"
      select Date::MONTHNAMES[profile[:dob].month.to_i], from: "profile[dob(2i)]"
      select profile[:dob].day.to_s, from: "profile[dob(3i)]"
      click_button 'Create Profile'
      page.should have_content 'Profile created'
    end

    specify 'should not create invalid profile' do
      profile = FactoryGirl.attributes_for(:profile)
      click_button 'Create Profile'
      page.should have_content "can't be blank"
    end
  end

end
