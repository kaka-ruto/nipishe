# == Schema Information
#
# Table name: users
#
#  id                     :bigint(8)        not null, primary key
#  first_name             :string
#  last_name              :string
#  email                  :string
#  avatar                 :string
#  phone_number           :string
#  gender                 :string
#  date_of_birth          :string
#  provider               :string           default("email"), not null
#  uid                    :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  allow_password_change  :boolean          default(FALSE)
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string
#  last_sign_in_ip        :string
#  confirmation_token     :string
#  confirmed_at           :datetime
#  confirmation_sent_at   :datetime
#  unconfirmed_email      :string
#  tokens                 :json
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#

RSpec.describe User, type: :model do
  let(:attributes) do
    {
      first_name: 'Ava',
      last_name: 'Mcclure',
      email: 'ava@mccluretwins.com',
      encrypted_password: 'c@ntt3lly0umyp@s$w0rD'
    }
  end
  let(:user) { build_stubbed(:user, **attributes) }

  describe 'Input Data' do
    it { expect(user).to allow_value(attributes[:first_name]).for(:first_name) }
    it { expect(user).to allow_value(attributes[:last_name]).for(:last_name) }
    it { expect(user).to allow_value(attributes[:email]).for(:email) }
    it { expect(user).to allow_value(attributes[:encrypted_password]).for(:encrypted_password) }
  end

  describe 'Validations' do
    it { expect(user).to validate_presence_of(:first_name) }
    it { expect(user).to validate_presence_of(:last_name) }
    it { expect(user).to validate_presence_of(:email) }
    # it { expect(user).to validate_presence_of(:encrypted_password) }
  end
end
