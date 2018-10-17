# frozen_string_literal: true

RSpec.describe Resolvers::Users::Register do
  let(:resolve) { described_class.new }
  let(:result) { resolve.call(nil, args, nil) }

  describe 'Success' do
    let(:args) do
      {
        attributes: {
          first_name: 'Ava',
          last_name: 'Mcclure',
          email: 'ava@mccluretwins.com',
          password: '[omitted]'
        }
      }
    end

    it { expect(result.user.persisted?).to eq(true) }
    it { expect(result.user.first_name).to eq('Ava') }
    it { expect(result.auth_token).not_to be_nil }
  end

  describe 'Failure' do
    let(:args) do
      {
        attributes: {
          first_name: 'Ava',
          last_name: 'Mcclure',
          email: 'ava@mccluretwins.com',
          password: nil
        }
      }
    end

    it { expect(result.message).to eq("Invalid attributes for User: Password can't be blank") }
  end
end
