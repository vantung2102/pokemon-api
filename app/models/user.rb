# == Schema Information
#
# Table name: users
#
#  id                         :uuid             not null, primary key
#  email                      :string           default(""), not null
#  email_verification_sent_at :datetime
#  email_verification_token   :string
#  email_verified_at          :datetime
#  name                       :string
#  omniauth_expires_at        :datetime
#  password_digest            :string           default(""), not null
#  provider                   :string
#  reset_password_sent_at     :datetime
#  reset_password_token       :string
#  uid                        :string
#  created_at                 :datetime         not null
#  updated_at                 :datetime         not null
#
class User < ApplicationRecord
  extend Enumerize
  rolify
  has_secure_password

  # validations
  validates :email, presence: true,
                    uniqueness: { case_sensitive: false },
                    format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :password, length: { minimum: 8 }, on: :create

  def auth_token
    JsonWebToken.encode(user_id: id)
  end

  def generate_email_verification_token!
    self.email_verification_token = generate_token
    self.email_verification_sent_at = Time.current
    save!
  end

  def email_token_expired?
    (email_verification_sent_at + 4.hours) < Time.current
  end

  def verify_email!
    self.email_verified_at = Time.current
    self.email_verification_token = nil
    save!
  end

  def generate_password_token!
    self.reset_password_token = generate_token
    self.reset_password_sent_at = Time.current
    save!
  end

  def password_token_expired?
    (reset_password_sent_at + 30.minutes) < Time.current
  end

  def reset_password!(new_password)
    self.reset_password_token = nil
    self.password = new_password
    save!
  end

  def self.from_omniauth(auth)
    user = User.find_by(email: auth.info.email)
    return user if user

    where(provider: auth.provider, uid: auth.info).first_or_create! do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
    end
  end

  private

  def generate_token
    (SecureRandom.random_number(9e5) + 1e5).to_i.to_s
  end
end
