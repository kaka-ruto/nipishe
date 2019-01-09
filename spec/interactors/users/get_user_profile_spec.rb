# frozen_string_literal: true

RSpec.describe Users::GetUserProfile, type: :interactor do
  subject(:context) { described_class.call(id: user_id) }

  let(:user) { create(:user) }

  describe '.call' do
    # Success
    context 'when user ID exists' do
      let(:user_id) { user.id }

      it 'passes context' do
        expect(context).to be_success
      end
    end

    # Failure
    context 'when the user does not exist' do
      let(:user_id) { 10 }

      it 'fails context' do
        expect(context).to be_failure
      end

      it 'returns a record not found message' do
        expect(context[:error]).to eq("Couldn't find User with 'id'=10")
      end
    end
  end
end
