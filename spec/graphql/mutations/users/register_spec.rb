# frozen_string_literal: true

RSpec.describe Mutations::Users::Register do
  subject(:context) do
    described_class.new(object: nil, context: nil).resolve(signup_attributes)
  end

  let(:signup_attributes) do
    {
      attributes: {
        first_name: 'Ava',
        last_name: 'Mcclure',
        email: 'ava.mcclure@gmail.com',
        password: '[Omitted]'
      }
    }
  end

  describe 'Success' do
    context 'when signup is successful' do
      it 'returns the created user' do
        expect(context[:user]).not_to be_nil
      end

      it 'returns an auth token' do
        expect(context[:auth_token]).not_to be_nil
      end

      it 'returns a success message' do
        expect(context[:message]).to eq('Successful Sign Up')
      end
    end
  end

  describe 'Failure' do
    context 'when registration fails' do
      let(:signup_attributes) do
        {
          attributes: {
            first_name: 'Ava',
            last_name: 'Mcclure',
            email: '',
            password: '[Omitted]'
          }
        }
      end

      it 'returns a sign up unsuccessful message' do
        expect(context[:message]).to eq('Sign Up Unsuccessful')
      end
    end
  end
end
