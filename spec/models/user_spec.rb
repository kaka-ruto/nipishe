# == Schema Information
#
# Table name: users
#
#  id                     :bigint(8)        not null, primary key
#  avatar                 :string
#  confirmation_sent_at   :datetime
#  confirmation_token     :string
#  confirmed_at           :datetime
#  current_sign_in_at     :datetime
#  current_sign_in_ip     :string
#  date_of_birth          :string
#  email                  :string
#  first_name             :string
#  gender                 :string
#  last_name              :string
#  last_sign_in_at        :datetime
#  last_sign_in_ip        :string
#  password_digest        :string           default(""), not null
#  phone_number           :string
#  provider               :string           default("email"), not null
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  sign_in_count          :integer          default(0), not null
#  uid                    :string           default(""), not null
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_confirmation_token    (confirmation_token) UNIQUE
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#  index_users_on_uid_and_provider      (uid,provider) UNIQUE
#

RSpec.describe User, type: :model do
  let(:attributes) do
    {
      first_name: 'Ava',
      last_name: 'Mcclure',
      email: 'ava@mccluretwins.com',
      password_digest: 'c@ntt3lly0umyp@s$w0rD'
    }
  end
  let(:user) { build_stubbed(:user, **attributes) }

  describe 'Validations' do
    it { expect(user).to validate_presence_of(:first_name) }
    it { expect(user).to validate_presence_of(:last_name) }
    it { expect(user).to validate_presence_of(:email) }
    it { expect(user).to validate_presence_of(:password_digest) }
  end

  describe 'Input Data' do
    it { expect(user).to allow_value(attributes[:first_name]).for(:first_name) }
    it { expect(user).to allow_value(attributes[:last_name]).for(:last_name) }
    it { expect(user).to allow_value(attributes[:email]).for(:email) }
    it { expect(user).to allow_value(attributes[:password_digest]).for(:password_digest) }
  end
end
