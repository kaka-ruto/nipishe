# frozen_string_literal: true

RSpec.describe Auth::LoginUser, type: :interactor do
  subject(:context) { described_class.call(attributes: login_attributes) }

  let(:signup_attributes) do
    {
      first_name: 'Ava',
      last_name: 'Mcclure',
      email: 'ava.mcclure@gmail.com',
      password: '[Omitted]'
    }
  end

  let!(:user) { User.create!(signup_attributes.to_h) }

  describe 'Success' do
    context 'when login attributes are valid' do
      let(:login_attributes) do
        {
          email: 'ava.mcclure@gmail.com',
          password: '[Omitted]'
        }
      end

      it 'passes context' do
        expect(context).to be_success
      end

      it 'returns user' do
        expect(context[:user_object][:user]).to eq(user)
      end

      it 'returns the auth_token' do
        expect(context[:user_object][:auth_token]).not_to be_nil
      end
    end
  end

  describe 'failure' do
    context 'when user does not exist' do
      let(:login_attributes) do
        {
          email: 'nanna.mcclure@gmail.com',
          password: '[Omitted]'
        }
      end

      it 'fails context' do
        expect(context).to be_failure
      end

      it 'returns a user not found error' do
        expect(context[:error]).to eq('User not found')
      end
    end

    context 'when the password is wrong' do
      let(:login_attributes) do
        {
          email: 'ava.mcclure@gmail.com',
          password: 'Comitted'
        }
      end

      it 'fails context' do
        expect(context).to be_failure
      end

      it 'returns an invalid password error' do
        expect(context[:error]).to eq('Invalid password')
      end
    end
  end
end
