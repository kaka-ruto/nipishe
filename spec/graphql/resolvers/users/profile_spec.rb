# frozen_string_literal: true

RSpec.describe Resolvers::Users::Profile do
  subject(:profile) do
    described_class.new(object: nil, context: { 'current_user': user })
  end

  let(:user) { create(:user) }

  describe '.resolve' do
    # Success
    context 'when the user is found' do

      it 'returns the user' do
        result = profile.resolve(id: user.id)

        expect(result[:user]).to eq(user)
      end
    end

    # Failure
    context 'when the user is not found' do
      it 'returns an error meesage' do
        result = profile.resolve(id: '1234')

        expect(result[:errors]).to eq("Couldn't find User with 'id'=1234")
      end
    end
  end
end
