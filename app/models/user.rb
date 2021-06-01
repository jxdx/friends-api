class User < ApplicationRecord
  # Password must contain at least 1 digit
  COMPLEXITY_REGEX = /^(?=.*?\d).+$/.freeze

  # encrypt password
  has_secure_password

  # Validations
  validates_presence_of :email, :password_digest
  validates_uniqueness_of :email, case_sensitive: false
  validates_format_of :email, with: /@/, message: 'is invalid'
  validates :password, length: { minimum: 8 }
  validate :password_complexity

  # relationships
  has_many :friendships

  # Callbacks
  before_save :downcase_email, if: lambda{ |user| user.email_changed? }

  private

  def downcase_email
    self.email = email.delete(' ').downcase
  end

  def password_complexity
    return if password.blank? || password =~ COMPLEXITY_REGEX

    errors.add(:password, 'password must contain 1 digit')
  end
end
