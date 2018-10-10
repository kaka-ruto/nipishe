# frozen_string_literal: true

RSpec.describe Resolvers::Users::Register do
  let(:resolve) { described_class.new }
  let(:user) { resolve.call(nil, args, nil) }

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

    it { expect(user.persisted?).to eq(true) }
    it { expect(user.first_name).to eq('Ava') }
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

    it { expect(user.message).to eq("Invalid attributes for User: Password can't be blank") }
  end
end
