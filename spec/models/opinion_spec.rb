require 'rails_helper'

RSpec.describe Opinion, type: :model do
  let(:user1) { User.new(fullname: 'example number', username: 'example', email: 'e@gmail.com', password: '123456') }
  let(:opinion1) { Opinion.new }
  let(:opinion2) { Opinion.new(thought: 'ok', user_id: 1) }

  describe 'associations' do
    it { should belong_to(:user) }
  end

  context 'validation test' do
    it 'ensures thought presence' do
      expect(opinion1.save).to eq(false)
    end

    it 'ensures user presence' do
      opinion1.thought = 'ok'
      expect(opinion1.save).to eq(false)
    end

    it 'will pass' do
      user1.save
      opinion1.thought = 'ok'
      opinion1.user_id = 1
      expect(opinion1.save).to eq(true)
    end
  end
end
