require "spec_helper"

describe "User registration" do

  before do
    visit "/users/sign_up"
  end

  it "allows the new user to register with valid data" do
    fill_in "Email",                 with: "random_user@example.com"
    fill_in "Password",              with: "password"
    fill_in "Password confirmation", with: "password"
    click_button "Sign up"

    page.should have_content("Welcome! You have signed up successfully.")
  end

  it "disallows the new user to register when email is blank" do
    fill_in "Email",                 with: ""
    fill_in "Password",              with: "password"
    fill_in "Password confirmation", with: "password"
    click_button "Sign up"

    page.should have_content("Email can't be blank")
  end

  it "disallows the new user to register when password != confirmation" do
    fill_in "Email",                 with: "random_user@example.com"
    fill_in "Password",              with: ""
    fill_in "Password confirmation", with: "password"
    click_button "Sign up"

    page.should have_content("Password can't be blank")
  end

  it "disallows the new user to register when password is to short" do
    fill_in "Email",                 with: "random_user@example.com"
    fill_in "Password",              with: "1"
    fill_in "Password confirmation", with: "1"
    click_button "Sign up"

    page.should have_content("Password is too short")
  end

  it "disallows the new user to register when email is not unique" do
    FactoryGirl.create :user, email: "random_user@example.com" 
    
    fill_in "Email",                 with: "random_user@example.com"
    fill_in "Password",              with: "password"
    fill_in "Password confirmation", with: "password"
    click_button "Sign up"

    page.should have_content("Email has already been taken")
  end
end