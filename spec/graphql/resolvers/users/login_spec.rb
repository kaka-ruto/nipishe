# frozen_string_literal: true

RSpec.describe Resolvers::Users::Login do
  let(:resolve) { described_class.new }
  let(:result) { resolve.call(nil, args, nil) }

  describe 'Success' do
    before do
      User.create!(args[:login_data].to_h)
    end

    let(:args) do
      {
        login_data: {
          first_name: 'Ava',
          last_name: 'Mcclure',
          email: 'ava@mccluretwins.com',
          password: 'Tough Password'
        }
      }
    end

    it { expect(result.auth_token).not_to be_nil }
  end

  describe 'Failure' do
    let(:args) do
      {
        login_data: {
          first_name: 'Ava',
          last_name: 'Mcclure',
          email: 'ava@mccluretwins.com',
          password: nil
        }
      }
    end

    it { expect(result.message).to eq('Your password or email seems incorrect') }
  end
end
