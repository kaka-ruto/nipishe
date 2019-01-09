# frozen_string_literal: true

RSpec.describe Users::UpdateUserProfile, type: :interactor do
  subject(:context) { described_class.call(attributes: new_attributes) }

  let(:user) { create(:user) }

  describe '.call' do
    # Success
    context 'when user ID exists' do
      let(:new_attributes) do
        {
          date_of_birth: '00-00-1967',
          gender: 'Male',
          last_name: 'Ruto'
        }
      end

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
