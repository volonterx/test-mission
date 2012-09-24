require 'spec_helper'

describe User do
  
  it { should have_many(:farms) }
  it { should have_many(:invitations) }
  it { should have_one(:profile) }

  describe "is_complited_registration?" do
    before(:each) do
      @user = FactoryGirl.create :user 
    end
    context "should be false" do
      it "if user does not do anything" do
        @user.is_complited_registration?.should be_false
      end

      it "if user does not filled profile" do
        FactoryGirl.create :farm, user: @user 
        FactoryGirl.create :invitation, user: @user 
        @user.is_complited_registration?.should be_false
      end

      it "if user does not have farm" do
        FactoryGirl.create :profile, user: @user 
        FactoryGirl.create :invitation, user: @user 
        @user.is_complited_registration?.should be_false
      end

      it "if user does not send invitation" do
        FactoryGirl.create :farm, user: @user 
        FactoryGirl.create :profile, user: @user 
        @user.is_complited_registration?.should be_false
      end

      it "if user only filled profile" do
        FactoryGirl.create :profile, user: @user 
        @user.is_complited_registration?.should be_false
      end

      it "if user only send invitation" do
        FactoryGirl.create :invitation, user: @user 
        @user.is_complited_registration?.should be_false
      end

      it "if user only have farm" do
        FactoryGirl.create :farm, user: @user 
        @user.is_complited_registration?.should be_false
      end
    end

    context "should be true" do
      it "if user filled profile, have farm and send invitation" do
        FactoryGirl.create :farm, user: @user 
        FactoryGirl.create :invitation, user: @user 
        FactoryGirl.create :profile, user: @user 
        @user.is_complited_registration?.should be_true
      end
    end
  end
end
