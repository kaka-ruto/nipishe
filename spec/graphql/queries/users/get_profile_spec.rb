# frozen_string_literal: true

RSpec.describe Queries::Users::GetProfile do
  subject(:profile) do
    described_class.new(object: nil, context: { 'current_user': user }).resolve(id: user_id)
  end

  let(:users) { create_list(:user, 2) }
  let(:user) { users.first }

  describe '.resolve' do
    # Success
    context 'when the user is authenticated' do
      let(:user_id) { user.id }

      it 'returns the user' do
        expect(profile).to eq(user)
      end
    end

    # Failure
    context 'when the user is not authenticated' do
      let(:user_id) { 10 }

      it 'returns a not allowed error message' do
        expect{ profile }.to raise_error(GraphQL::ExecutionError, 'You are not allowed')
      end
    end
  end
end
