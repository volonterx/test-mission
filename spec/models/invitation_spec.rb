require 'spec_helper'

describe Invitation do
  it { should belong_to(:user) }
  it { should belong_to(:invitee).class_name("User") }
  it { should validate_presence_of(:invitee_id) }
end
