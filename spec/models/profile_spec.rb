require 'spec_helper'

describe Profile do
  it { should belong_to(:user) }
  it { should validate_presence_of(:country) }
  it { should validate_presence_of(:dob) }
end
