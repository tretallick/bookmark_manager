require 'spec_helper'
require_relative 'helpers/session'

include SessionHelpers

feature 'Favourite links' do

  before(:each) {
    @link1 = Link.create( :url => "http://www.makersacademy.com", 
      :title => "Makers Academy",
      :tags => [Tag.first_or_create(:text => 'education')])

    @user = User.create(:email => "test@test.com", 
      :password => 'test', 
      :password_confirmation => 'test')
  }

  scenario 'User can favourite a link' do
    visit ('/')
    sign_in('test@test.com', 'test')
    expect(@user.links.count).to eq(0)
    click_button('Favourite')
    expect(@user.links.count).to eq(1)
  end

  scenario 'User can see how many times link has been favourited' do
    visit('/')
    sign_in('test@test.com', 'test')
    expect(@link1.users.count).to eq(0)
    click_button('Favourite')
    expect(@link1.users.count).to eq(1)
  end

end