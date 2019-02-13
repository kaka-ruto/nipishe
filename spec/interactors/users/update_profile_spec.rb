# frozen_string_literal: true

RSpec.describe Users::UpdateProfile, type: :interactor do
  subject(:context) { described_class.call(user: user, attributes: new_attributes) }

  let(:user) { create(:user) }

  describe '.call' do
    # Success
    context 'when the new attributes are valid' do
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
    context 'when the new attributes are invalid' do
      let(:new_attributes) do
        {
          date_of_birth: '00-00-1967',
          gender: 'Male',
          last_name: ''
        }
      end

      it 'fails context' do
        expect(context).to be_failure
      end

      it 'raises a RecordInvalid error' do
        expect(context[:error]).to eq("Validation failed: Last name can't be blank")
      end
    end
  end
end
