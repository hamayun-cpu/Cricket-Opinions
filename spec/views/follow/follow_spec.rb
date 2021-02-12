require 'rails_helper'

RSpec.describe 'Testing follower behavior' do
  before :each do
    @user1 = User.create(fullname: 'test1', username: 't1', email: 'test1@test.com', password: '123456', id: 1)
    @user2 = User.create(fullname: 'test2', username: 't2', email: 'test2@test.com', password: '123456', id: 2)
    @user3 = User.create(fullname: 'test3', username: 't3', email: 'test3@test.com', password: '123456', id: 3)
    Follow.create(follower_id: 2, followed_id: 1)
    Follow.create(follower_id: 1, followed_id: 2)
    Follow.create(follower_id: 3, followed_id: 1)
  end
  feature 'User can' do
    scenario 'visit profile' do
      visit '/users/sign_in'
      fill_in 'Email', with: 'test1@test.com'
      fill_in 'Password', with: '123456'
      click_button 'Log in'
      visit '/users/1'
      expect(page).to have_content('test2')
      expect(page).to have_content('test3')
    end
  end
end
