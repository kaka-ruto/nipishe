# frozen_string_literal: true

RSpec.describe Mutations::Users::Register, type: :request do
  subject(:sign_up) do
    NipisheSchema.execute(query_string, variables: variables)
  end

  let(:variables) do
    {
      "attributes" => {
        "firstName" => "Ava",
        "lastName" => "Mcclure",
        "email" => "ava.mcclure@gmail.com",
        "password" => "[Omitted]"
      }
    }
  end

  describe '.resolve' do
    context 'when all fields are provided correctly' do
      it 'creates a new user' do
        expect { sign_up }.to change(User, :count).by(1)
      end

      it 'returns the created user' do
        expect(sign_up['data']['register']['user']).not_to be_nil
      end

      it 'returns an auth token' do
        expect(sign_up['data']['register']['auth_token']).not_to be_nil
      end

      it 'returns a success message' do
        expect(sign_up['data']['register']['message']).to eq('Successful Sign Up')
      end
    end

    context 'when registration fails' do
      let(:variables) do
        {
          "attributes": {
            "first_name": "Ava",
            "last_name": "Mcclure",
            "email": "",
            "password": "[Omitted]"
          }
        }
      end

      it 'returns a sign up unsuccessful message' do
        expect(sign_up['data']['register']['message']).to eq('Sign Up Unsuccessful')
      end
    end
  end

  def query_string
    <<~GQL
      mutation register($attributes: Registration!) {
        register(params: $attributes) {
          user {
            firstName
            lastName
            email
          }
          errors
        }
      }
    GQL
  end
end
