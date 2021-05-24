require 'rails_helper'
# include RSpec::Matchers

RSpec.describe 'Friendships API', type: :request do
  let(:user) { create(:user) }
  let!(:friend) { create(:user) }
  # authorize request
  let(:headers) { valid_headers }
  let(:valid_attributes) { { email: friend.email } }
  let(:invalid_attributes) { { email: 'dummy@gmail.com' } }

  let(:expected_response) do
    {
      'friendship': {
        'user': { 
          'name': user.name,
          'email': user.email
        },
        'friend': {
          'name': friend.name,
          'email': friend.email
        }
      }
    }.with_indifferent_access
    
  end

  # Test suite for GET /users/me/friends
  describe 'GET /users/me/friends' do
    let!(:friendship) { Friendship.create(user_id: user.id, friend_id: friend.id) }

    before do 
      get '/users/me/friends', params: {}, headers: headers
    end

    it 'returns friends' do
      # Note `json` is a custom helper to parse JSON responses
      expect(json['friends']).not_to be_empty
      expect(json['friends'].size).to eq(1)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  # Test suite for POST /friendships
  describe 'POST /frienships' do
    context 'when valid request' do
      before { post "/friendships", params: valid_attributes.to_json, headers: headers }

      it 'creates a new friendship' do
        expect(response).to have_http_status(201)
      end

      it 'returns an frienship record' do
        expect(json['friendship']).not_to be_nil
      end

      it 'returns the expected friendship record' do
        expect(json).to eq(expected_response)
      end
    end

    context 'when a friendship already exists' do
      before { post "/friendships", params: valid_attributes.to_json, headers: headers }
      it 'does not change create the friendship twice' do
        expect do
          post "/friendships", params: valid_attributes.to_json, headers: headers
        end.to_not change { Friendship.count }
      end
    end

    context 'when invalid request' do
      before { post '/friendships', params: {}, headers: headers }

      it 'does not create a new friendship' do
        expect(response).to have_http_status(400)
      end

      it 'returns failure message' do
        expect(json['error']['messages'][0])
          .to match(/Friend not found/)
      end
    end
  end
end
