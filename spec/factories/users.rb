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
FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    password { Faker::Internet.password }
  end
end
