require 'rails_helper'

RSpec.describe Friendship, type: :model do
  # Validation tests
  it { should validate_presence_of(:user_id) }
  it { should validate_presence_of(:friend_id) }

  describe '#friendships' do
    let(:user) { create(:user) }
    let(:friend) { create(:user) }
    context 'when the logged in user has a friend' do
      let!(:friendship) { create(:friendship, user_id: user.id, friend_id: friend.id) }

      it 'returns the correct user as a friend (not yourself)' do
        expect(described_class.friendships(user).first).to eq(friend)
      end
    end

    context 'when the logged in user is a friend' do
      let!(:friendship) { create(:friendship, user_id: friend.id, friend_id: user.id) }

      it 'returns the correct user as a friend (not yourself)' do
        expect(described_class.friendships(user).first).to eq(friend)
      end
    end
  end
end
