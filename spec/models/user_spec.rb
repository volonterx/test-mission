require 'spec_helper'

describe User do
  
  it { should have_many(:farms) }
  it { should have_many(:invitations) }
  it { should have_one(:profile) }

  describe "show_welcome_page?" do
    before do
      @user = FactoryGirl.create :user 
      FactoryGirl.create :farm, user: @user 
      FactoryGirl.create :invitation, user: @user 
      FactoryGirl.create :profile, user: @user 
    end
    context "should be false" do
      it "if user does not do anything" do
        @user.stub(:profile).and_return(false)
        @user.stub(:farms).and_return([])
        @user.stub(:invitations).and_return([]) 
        @user.show_welcome_page?.should be_false
      end

      it "if user does not filled profile" do
        @user.stub(:profile).and_return(false)
        @user.show_welcome_page?.should be_false
      end

      it "if user does not have farm" do
        @user.stub(:farms).and_return([])
        @user.show_welcome_page?.should be_false
      end

      it "if user does not send invitation" do
        @user.stub(:invitations).and_return([]) 
        @user.show_welcome_page?.should be_false
      end
    end

    context "should be true" do
      it "if user filled profile, have farm and send invitation" do
        @user.show_welcome_page?.should be_true
      end
    end
  end
end
