# frozen_string_literal: true

RSpec.describe Resolvers::Schools::CreateSchool do
  let(:resolve) { described_class.new }
  let(:result) { resolve.call(nil, args, nil) }

  describe 'Success' do
    let(:args) do
      {
        attributes: {
          name: 'The Great School'
        }
      }
    end

    it { expect(result.school.persisted?).to eq(true) }
    it { expect(result.school.name).to eq('The Great School') }
  end

  describe 'Failure' do
    let(:args) do
      {
        attributes: {
          name: nil
        }
      }
    end

    it { expect(result.message).to eq("Invalid attributes for School: Name can't be blank") }
  end
end
