# frozen_string_literal: true

RSpec.describe Queries::Users::Profile do
  subject(:profile) do
    described_class.new(object: nil, context: context).resolve(id: user.id)
  end

  let(:users) { create_list(:user, 2) }
  let(:user) { users.first }

  describe '.resolve' do
    # Success
    context 'when the user is authenticated' do
      let(:context)  { { 'current_user': user } }

      it 'returns the user' do
        expect(profile).to eq(user)
      end
    end

    # Failure
    context 'when the user is not authenticated' do
      let(:context) {{ 'current_user': nil }}

      it 'returns a not allowed error message' do
        expect{ profile }.to raise_error(GraphQL::ExecutionError, 'You are not allowed')
      end
    end
  end
end
