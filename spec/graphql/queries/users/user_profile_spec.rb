# frozen_string_literal: true

RSpec.describe Queries::Users::UserProfile do
  subject(:profile) do
    described_class.new(object: nil, context: users.first).resolve(id: users.first.id)
  end

  let(:users) { create_list(:user, 2) }

  # Success
  describe '.resolve' do
    context 'when the user exists' do
      it 'returns the user' do
        expect(profile).to eq(users.first)
      end
    end
  end
end
