# frozen_string_literal: true
require 'rails_helper'

RSpec.describe Mutations::Users::UpdateProfile do
  subject(:profile) do
    described_class.new(object: nil, context: { 'current_user': user })
                   .resolve(id: user_id, attributes: new_attributes)
  end

  let(:user) { create(:user) }

  describe '.resolve' do
    # Success
    let(:user_id) { user.id }
    let(:new_attributes) do
      {
        date_of_birth: '00-00-1967',
        gender: 'Male',
        last_name: 'Ruto'
      }
    end

    context 'when the user exists' do
      it 'updates the user' do
        expect(profile.user).to have_attributes new_attributes
      end
    end

    # Failure
    context 'when the user is not authenticated' do
      let(:user_id) { 10 }

      it 'returns a user not found error message' do
        expect(profile[:errors]).to eq ['Authentication required']
      end

      it 'does not update the user' do
        expect(user).not_to have_attributes new_attributes
      end
    end

    context 'when the new attributes are invalid' do
      let(:new_attributes) do
        {
          date_of_birth: '00-00-1967',
          gender: 'Male',
          last_name: ''
        }
      end

      it 'returns a User Update Not Successful error message' do
        expect(profile[:message]).to eq 'User Update Not Successful'
      end
    end
  end
end
