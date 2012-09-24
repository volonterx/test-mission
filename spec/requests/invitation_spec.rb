require 'spec_helper'

describe 'New invitation page' do

  context 'when user does not authorized' do
    specify 'should show sign in page' do
      visit '/invitations/new'
      page.should have_content 'Sign in'
    end
  end


  context 'when user authorized' do
    before(:each) do
      @user = FactoryGirl.create :user 
      @invitee_user = FactoryGirl.create :user, email: "invitee_user@example.com"
      visit '/users/sign_in'
      fill_in "Email", :with => @user.email
      fill_in "Password", :with => @user.password
      click_button "Sign in"
      visit '/invitations/new'
    end

    specify 'should show new invitation page' do
      page.should have_content 'New invitation'
    end

    specify 'should create valid invitation' do
      invitation = FactoryGirl.attributes_for(:invitation)
      select @invitee_user.email, from: "invitation[invitee_id]"
      click_button 'Create Invitation'
      page.should have_content 'Invitation created'
    end

    specify 'should not create invalid invitation' do
      invitation = FactoryGirl.attributes_for(:invitation)
      click_button 'Create Invitation'
      page.should have_content "can't be blank"
    end
  end

end
