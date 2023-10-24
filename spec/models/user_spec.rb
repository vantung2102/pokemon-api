# == Schema Information
#
# Table name: users
#
#  id                     :uuid             not null, primary key
#  confirmation_sent_at   :datetime
#  confirmation_token     :string
#  confirmed_at           :datetime
#  current_sign_in_at     :datetime
#  current_sign_in_ip     :string
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  failed_attempts        :integer          default(0), not null
#  first_name             :string           default(""), not null
#  last_name              :string           default(""), not null
#  last_sign_in_at        :datetime
#  last_sign_in_ip        :string
#  locked_at              :datetime
#  omniauth_expires_at    :datetime
#  provider               :string
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  sign_in_count          :integer          default(0), not null
#  uid                    :string
#  unconfirmed_email      :string
#  unlock_token           :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_confirmation_token    (confirmation_token) UNIQUE
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#  index_users_on_unlock_token          (unlock_token) UNIQUE
#
require 'rails_helper'

RSpec.describe User, type: :model do
  subject { build(:user) }

  describe 'validates' do
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_uniqueness_of(:email).case_insensitive }
    it { is_expected.to validate_presence_of(:password) }
    it { is_expected.to validate_length_of(:password).is_at_least(8).is_at_most(128) }
    it { is_expected.to validate_presence_of(:first_name) }
    it { is_expected.to validate_presence_of(:last_name) }
    it { should validate_content_type_of(:avatar).allowing('image/png', 'image/jpeg') }
    it { should validate_size_of(:avatar).less_than(10.megabytes) }

    # Test associations
  it { should have_one_attached(:avatar) }

  # Test class method from_omniauth
  describe '.from_omniauth' do
    it 'finds or creates a user from OmniAuth data' do
      # Your test code for the from_omniauth method goes here
    end
  end

  # Test Devise modules
  it { should have_db_column(:confirmation_token).of_type(:string) }
  it { should have_db_column(:locked_at).of_type(:datetime) }
  it { should have_db_index(:confirmation_token).unique }
  it { should have_db_index(:unlock_token).unique }
  it { should have_db_index(:email).unique }
  it { should have_db_index(:reset_password_token).unique }
  end
end
