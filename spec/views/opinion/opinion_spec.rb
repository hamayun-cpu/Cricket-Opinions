# rubocop:disable Metrics/BlockLength
require 'rails_helper'

RSpec.describe 'Test to verify if the users opinions' do
  before :each do
    @user1 = User.create(fullname: 'test1', username: 't1', email: 'test1@test.com', password: '123456', id: 1)
    @user2 = User.create(fullname: 'test2', username: 't2', email: 'test2@test.com', password: '123456', id: 2)
    @user3 = User.create(fullname: 'test3', username: 't3', email: 'test3@test.com', password: '123456', id: 3)
    Opinion.create(user_id: 1, thought: 'test1 Opinion')
    Opinion.create(user_id: 2, thought: 'test2 Opinion')
    Opinion.create(user_id: 3, thought: 'test3 Opinion')
    Follow.create(follower_id: 1, followed_id: 2)
  end
  feature 'User can see other users opinions if he followed the other user' do
    scenario 'sign in and go to opinion index' do
      visit '/users/sign_in'
      fill_in 'Email', with: 'test1@test.com'
      fill_in 'Password', with: '123456'
      click_button 'Log in'
      expect(page).to have_content('test2 Opinion')
    end
  end

  feature 'User can create opinion' do
    scenario 'sign in and go to opinion index' do
      visit '/users/sign_in'
      fill_in 'Email', with: 'test1@test.com'
      fill_in 'Password', with: '123456'
      click_button 'Log in'
      visit '/users/1'
      expect(page).to have_content('test1 Opinion')
    end
  end
end
# rubocop:enable Metrics/BlockLength
