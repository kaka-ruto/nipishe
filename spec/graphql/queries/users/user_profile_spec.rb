# frozen_string_literal: true

RSpec.describe Queries::Users::UserProfile do
  subject(:profile) do
    described_class.new(object: nil, context: user).resolve(id: user_id)
  end

  let(:users) { create_list(:user, 2) }
  let(:user) { users.first }
  let(:headers) { { 'Authorization' => token_generator(user.id) } }

  describe '.resolve' do
    # Success
    context 'when the user exists' do
      let(:user_id) { user.id }
      # before { allow(request).to receive(:headers).and_return(headers) }

      it 'returns the user' do
        expect(profile).to eq(user)
      end
    end

    # Failure
    context 'when the user is not found' do
      let(:user_id) { 10 }

      it 'returns a user not found error message' do
        expect(profile[:message]).to eq('User Not Found')
      end
    end
  end
end
