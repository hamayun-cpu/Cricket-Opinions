require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user1) { User.new }
  let(:user2) { User.new(fullname: 'example number', username: 'example', email: 'e@gmail.com', password: '123456') }

  describe 'associations' do
    it { should have_many(:opinions) }
    it { should have_many(:followers) }
    it { should have_many(:followings) }
  end

  context 'validation test' do
    it 'ensures fullname presence' do
      user1.username = 'testt'
      user1.email = 'testt@gmail.com'
      expect(user1.save).to eq(false)
    end

    it 'ensures username presence' do
      user1.fullname = 'test test'
      user1.username = ''
      expect(user1.save).to eq(false)
    end

    it 'ensures email presence' do
      user1.username = 'testt'
      user1.email = ''
      expect(user1.save).to eq(false)
    end

    it 'save the user' do
      expect(user2.save).to eq(true)
    end
  end
end
