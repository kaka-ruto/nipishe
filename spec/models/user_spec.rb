# == Schema Information
#
# Table name: users
#
#  id                     :bigint(8)        not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  first_name             :string
#  last_name              :string
#  username               :string
#  date_of_birth          :string
#  api_token              :string
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
