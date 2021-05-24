require 'rails_helper'

RSpec.describe Friendship, type: :model do
  # Validation tests
  it { should validate_presence_of(:user_id) }
  it { should validate_presence_of(:friend_id) }
end
