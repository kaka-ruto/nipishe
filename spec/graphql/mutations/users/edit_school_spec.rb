# frozen_string_literal: true

RSpec.describe Mutations::Schools::EditSchool do
  let(:subject) { described_class.new(object: nil, context: nil) }
  let(:school) { create(:school, name: 'Kyambogo University') }
  let(:result) { subject.resolve(arguments) }

  describe 'Success' do
    context 'when id and the attributes to be updated are provided' do
      let(:arguments) do
        {
          id: school.id,
          attributes: {
            year_of_founding: '1990-06-10'
          }
        }
      end

      it 'updates school' do
        expect {
          result
          school.reload
        }.to change(school, :year_of_founding)
      end

      it { expect(result[:errors]).to be_empty }
    end
  end

  describe 'Failure' do
    context 'when the school id is not found' do
      let(:arguments) do
        {
          id: 100,
          attributes: {
            name: 'Mangu School'
          }
        }
      end

      it { expect { result }.not_to change(school, :name) }
      it { expect(result[:errors]).to eq(["Couldn't find School with 'id'=#{arguments[:id]}"]) }
    end

    context 'when the passed attribute is invalid' do
      let(:arguments) do
        {
          id: school.id,
          attributes: {
            name: nil
          }
        }
      end

      it { expect { result }.not_to change(school, :name) }

      it { expect(result[:errors]).to eq(["Validation failed: Name can't be blank"]) }
    end
  end
end
