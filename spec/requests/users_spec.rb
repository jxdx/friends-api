require 'rails_helper'

RSpec.describe 'Users API', type: :request do
  let(:user) { create(:user) }
  let!(:users) { create_list(:user, 9) }
  let(:valid_attributes) do
    attributes_for(:user, password_confirmation: user.password)
  end
  # authorize request
  let(:headers) { valid_headers }

  # Test suite for GET /users
  describe 'GET /users' do
    # make HTTP get request before each example
    before { get '/users', params: {}, headers: headers }

    it 'returns users' do
      # Note `json` is a custom helper to parse JSON responses
      expect(json['users']).not_to be_empty
      expect(json['users'].size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  # User signup test suite
  describe 'POST /signup' do
    context 'when valid request' do
      before { post '/signup', params: valid_attributes.to_json, headers: headers }

      it 'creates a new user' do
        expect(response).to have_http_status(201)
      end

      it 'returns an authentication token' do
        expect(json['auth_token']).not_to be_nil
      end
    end

    context 'when invalid request' do
      let(:message) do
        "Validation failed: Password can't be blank,"\
        ' Password is too short (minimum is 8 characters),'\
        " Email can't be blank,"\
        ' Email is invalid,'\
        " Password digest can't be blank"
      end
      before { post '/signup', params: {}, headers: headers }

      it 'does not create a new user' do
        expect(response).to have_http_status(422)
      end

      it 'returns failure message' do
        expect(json['message']).to eq(message)
      end
    end
  end
end
