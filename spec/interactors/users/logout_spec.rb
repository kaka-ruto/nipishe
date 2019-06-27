# frozen_string_literal: true

RSpec.describe Users::Logout, type: :interactor do
  subject(:logout) { described_class.call(user: logged_in_user) }

  let(:attributes) {{ email: 'one@two.com', password: '@vat@r' }}
  let(:new_user) { create(:user, email: attributes[:email],
                                 password: attributes[:password]) }
  let(:logged_in_user) { login_user(new_user) }

  describe 'logout' do
    it 'succeeds' do
      expect(logout).to be_success
    end

    it 'sets the user token to nil' do
      expect { logout }.to change(logged_in_user, :auth_token).to nil
    end

    it 'sets the user to nil' do
      expect { logout }.to change(logged_in_user, :user).to nil
    end
  end

  def login_user(new_user)
    ::Users::Login.call(attributes: attributes)
  end
end

