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
require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to allow_value('me@go.com').for(:email) }
    it { is_expected.not_to allow_value('me.com').for(:email) }
    it { is_expected.to validate_presence_of(:password) }
    it { is_expected.to validate_length_of(:password).is_at_least(8) }
  end

  describe '#auth_token' do
    let(:user) { build(:user, id: 1) }

    it 'returns correct jwt token' do
      token = user.auth_token
      object = JsonWebToken.decode(token)
      expect(object.dig(:data, :user_id)).to eq(1)
    end
  end
end
