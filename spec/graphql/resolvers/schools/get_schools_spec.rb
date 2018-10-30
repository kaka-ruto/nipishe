# frozen_string_literal: true

RSpec.describe Resolvers::Schools::GetSchools do
  let(:resolve) { described_class.new }
  let(:result) { resolve.call(nil, nil, nil) }
  let(:schools) { create_list(:school, 3) }

  describe 'Success' do
    context 'when the user has more than one existing schools' do
      it { expect(result[:school]).not_to be_nil }
      it { expect(result[:errors]).to be_empty }
    end
  end

  describe 'Failure' do
    context 'when the user does not have existing schools' do
      pending
    end
  end
end
