# frozen_string_literal: true

RSpec.describe Resolvers::Schools::GetSchool do
  let(:resolve) { described_class.new }
  let(:result) { resolve.call(nil, args, nil) }
  let(:school) { create(:school) }

  describe 'Success' do
    context 'when school exists' do
      let(:args) do
        {
          id: school.id
        }
      end

      it { expect(result[:school]).not_to be_nil }
      it { expect(result[:errors]).to be_empty }
    end
  end

  describe 'Failure' do
    context 'when school id does not exist' do
      let(:args) do
        {
          id: 100
        }
      end

      it { expect(result[:school]).to be_nil }
      it { expect(result[:errors]).to eq("Couldn't find School with 'id'=#{args[:id]}") }
    end
  end
end
