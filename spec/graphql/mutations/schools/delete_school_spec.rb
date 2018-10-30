# frozen_string_literal: true

RSpec.describe Mutations::Schools::DeleteSchool do
  let(:subject) { described_class.new(object: nil, context: nil) }
  let(:school) { create(:school) }
  let(:result) { subject.resolve(arguments) }

  describe 'Success' do
    context 'when the school exists' do
      let(:arguments) do
        {
          id: school.id
        }
      end

      it 'deletes school' do
        result
        expect { school.reload }.to raise_error ActiveRecord::RecordNotFound
      end

      it { expect(result[:errors]).to be_empty }
    end
  end

  describe 'Failure' do
    context 'when the school id is not found' do
      let(:arguments) do
        {
          id: 100
        }
      end

      it { expect { result }.not_to change(School, :count) }
      it { expect(result[:errors]).to eq(["Couldn't find School with 'id'=#{arguments[:id]}"]) }
    end

    context 'when the passed attribute is invalid' do
      let(:arguments) do
        {
          id: nil
        }
      end

      it { expect { result }.not_to change(School, :count) }
      it { expect(result[:errors]).to eq(["Couldn't find School without an ID"]) }
    end
  end
end
