# frozen_string_literal: true

RSpec.describe Mutations::Users::Login do
  subject(:context) do
    described_class.new(object: nil, context: user).resolve(attributes)
  end

  let!(:user) { User.create!(signup_attributes.to_h) }
  let(:signup_attributes) do
    {
      first_name: 'Ava',
      last_name: 'Mcclure',
      email: 'ava.mcclure@gmail.com',
      password: '[Omitted]'
    }
  end

  describe 'Success' do
    context 'when login attributes are valid' do
      let(:attributes) do
        {
          attributes: {
            email: 'ava.mcclure@gmail.com',
            password: '[Omitted]'
          }
        }
      end

      it 'returns the user' do
        expect(context[:user]).to eq(user)
      end

      it 'returns the auth token' do
        expect(context[:auth_token]).not_to be_nil
      end

      it 'returns a success message' do
        expect(context[:message]).to eq('Successful Login')
      end

      it 'returns an empty errors list' do
        expect(context[:errors]).to be_empty
      end
    end
  end

  describe 'Failure' do
    context 'when one of the passed attributes is invalid' do
      let(:attributes) do
        {
          attributes: {
            email: nil,
            password: '[Omitted]'
          }
        }
      end

      it 'returns nil user' do
        expect(context[:user]).to eq nil
      end

      it 'returns login failed message' do
        expect(context[:message]).to eq('Login Unsuccessful')
      end

      it 'returns appropriate context error message' do
        expect(context[:errors]).to eq("Couldn't find User")
      end
    end
  end
end
