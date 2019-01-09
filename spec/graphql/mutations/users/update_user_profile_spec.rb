# frozen_string_literal: true
require 'rails_helper'

RSpec.describe Mutations::Users::UpdateUserProfile do
  subject(:profile) do
    # Use context instead of passing the user id
    described_class.new(object: nil, context: user).resolve(id: user_id, attributes: new_attributes)
  end

  let(:user) { create(:user) }
  let(:headers) { { 'Authorization' => token_generator(user.id) } }

  describe '.resolve' do
    # Success
    context 'when the user exists' do
      let(:user_id) { user.id }
      let(:new_attributes) do
        {
          date_of_birth: '00-00-1967',
          gender: 'Male',
          last_name: 'Ruto'
        }
      end

      # before { allow(request).to receive(:headers).and_return(headers) }

      # binding.pry
      it 'updates the user' do
        expect(profile).to eq(user)
      end
    end

    # Failure
    context 'when the user is not found' do
      let(:user_id) { 10 }

      it 'returns a user not found error message' do
        expect(profile[:message]).to eq('User Not Found')
      end

      it 'dos not update the user' do
        expect(profile).to eq(user)
      end
    end
  end
end
