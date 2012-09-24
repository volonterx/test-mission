require 'spec_helper'

describe Farm do
  it { should belong_to(:user) }
  it { should validate_presence_of(:title) }
end
