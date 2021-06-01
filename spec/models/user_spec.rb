require 'rails_helper'

RSpec.describe User, type: :model do
  # Validation tests
  # ensure name, email and password_digest are present before save
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:password_digest) }

  it "doesn't allow creating a user without a password" do
    user = described_class.new(email: 'foo@bar.com')
    expect(user).not_to be_valid
    user.save
    expect(user.errors.messages).to have_key(:password)
  end

  it "doesn't allow a password shorter than 8 characters" do
    user = described_class.new(email: 'foo@bar.com', password: '1234567')
    expect(user).not_to be_valid
  end

  describe '#validations' do
    describe '#password_complexity' do
      subject do
        user = User.new(password: password)
        user.valid?
        user
      end

      context 'with a password with a valid length' do
        context 'with a digit' do
          let(:password) { 'aaaaaaaaaa1' }

          it 'does not set an error' do
            expect(subject.errors[:password]).to be_empty
          end
        end
        context 'without a digit' do
          let(:password) { 'aaaaaaaaaa' }

          it 'returns a specific error' do
            expect(subject.errors[:password]).to include(/password must contain 1 digit/)
          end
        end
      end
      context 'without the @ in the email' do
        it 'marks the email as invalid' do
          user = User.new(password: 'password1')
          user.email = 'invalidvalid.valid.com'
          user.valid?

          expect(user.errors[:email]).to include(/is invalid/)
        end
      end
    end
  end
end
