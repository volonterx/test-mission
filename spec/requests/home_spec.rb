require 'spec_helper'

describe 'Home' do
  specify 'should show welcome message' do
    visit '/'
    page.should have_content 'Welcome'
  end
end