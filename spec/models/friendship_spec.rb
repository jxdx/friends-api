require 'rails_helper'

RSpec.describe Friendship, type: :model do
  # Validation tests
  it { should validate_presence_of(:user_id) }
  it { should validate_presence_of(:friend_id) }

  describe '#friendships' do
    let(:user) { create(:user) }
    let(:friend) { create(:user) }
    let!(:friendship) { create(:friendship, user_id: user.id, friend_id: friend.id)}

    context 'when the logged in user has a friend' do
      it 'returns the correct user as a friend' do
        expect(Friendship.first.user_id).to eq(user.id)
        expect(Friendship.first.friend_id).to eq(friend.id)
      end
    end

    context 'when the logged in user is a friend' do
      let!(:friendship2) { create(:friendship, user_id: friend.id, friend_id: user.id)}
      it 'returns both friendshp records' do
        expect(Friendship.first.user_id).to eq(user.id)
        expect(Friendship.first.friend_id).to eq(friend.id)
        expect(Friendship.last.user_id).to eq(friend.id)
        expect(Friendship.last.friend_id).to eq(user.id)
      end
    end
  end
end
