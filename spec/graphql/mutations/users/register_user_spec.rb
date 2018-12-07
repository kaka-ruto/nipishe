# frozen_string_literal: true

RSpec.describe Mutations::Users::RegisterUser do
  subject(:context) do
    described_class.new(object: nil, context: nil).resolve(signup_attributes)
  end

  let(:headers) { valid_headers.except('Authorization') }
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

  # before do
  #   allow(Auth::RegisterUser).to receive(:call!)
  #     .with(attributes: signup_attributes)
  #     .once
  # end

  describe 'Success' do
    context 'when signup attributes are valid' do
      # it 'calls Auth::RegisterUser' do
      #   expect(Auth::RegisterUser).to have_received(:call!)
      #     .with(attributes: signup_attributes)
      #     .once
      # end

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
    context 'when one of the signup attributes is invalid' do
      let(:signup_attributes) do
        {
          attributes: {
            first_name: 'Ava',
            last_name: nil,
            email: 'ava.mcclure@gmail.com',
            password: '[Omitted]'
          }
        }
      end

      it "throws a field can't be blank error" do
        expect(context[:errors]).to eq("Validation failed: Last name can't be blank")
      end

      it 'returns a sign up unsuccessful message' do
        expect(context[:message]).to eq('Sign Up Unsuccessful')
      end
    end

    context 'when password is invalid' do
      let(:signup_attributes) do
        {
          attributes: {
            first_name: 'Ava',
            last_name: 'Mcclure',
            email: 'ava.mcclure@gmail.com',
            password: ''
          }
        }
      end

      it 'returns password failure errors' do
        # TODO: Check why two password error messages are being returned
        expect(context[:errors])
          .to match("Validation failed: Password can't be blank, Password digest can't be blank")
      end
    end
  end
end
