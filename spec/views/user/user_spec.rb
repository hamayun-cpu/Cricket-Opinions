require 'rails_helper'

RSpec.describe 'Users' do
  before :each do
    @user1 = User.create(fullname: 'test1', username: 't1', email: 'test1@test.com', password: '123456', id: 1)
    @user2 = User.create(fullname: 'test2', username: 't2', email: 'test2@test.com', password: '123456', id: 2)
    @user3 = User.create(fullname: 'test3', username: 't3', email: 'test3@test.com', password: '123456', id: 3)
    Follow.create(follower_id: 2, followed_id: 1)
    Follow.create(follower_id: 3, followed_id: 2)
  end
  feature 'User can' do
    scenario 'user can login and logout' do
      visit '/users/sign_in'
      fill_in 'Email', with: 'test1@test.com'
      fill_in 'Password', with: '123456'
      click_button 'Log in'
      expect(page).to have_content('test1')
      click_on '.'
      click_on 'logout'
      expect(page).to have_content('You need to sign in or sign up before continuing')
    end

    scenario 'user can follow' do
      visit '/users/sign_in'
      fill_in 'Email', with: 'test1@test.com'
      fill_in 'Password', with: '123456'
      click_button 'Log in'
      visit '/users/2'
      expect(page).to have_content('test3')
    end
  end
end
