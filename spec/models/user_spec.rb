require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user1) { User.new(id: 1, fullname: 'hamayun waheed', username: 'hamayun', email: 'h@gmail.com') }
  let(:user2) { User.new(id: 2, fullname: 'example number', username: 'example', email: 'e@gmail.com') }

  let(:opinion1) { Opinion.new(thought: 'example', user_id: 1) }

  let(:follower1) { Follow.new(follower_id: 1, followed_id: 2) }
  let(:follower2) { Follow.new(follower_id: 2, followed_id: 1) }

  describe 'associations' do
    it { should have_many(:opinions) }
    it { should have_many(:followers) }
    it { should have_many(:followings) }
  end
end
