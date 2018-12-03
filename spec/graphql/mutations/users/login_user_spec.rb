# frozen_string_literal: true

RSpec.describe Mutations::Users::LoginUser do
  let(:subject) { described_class.new(object: nil, context: nil) }
  let(:result) { subject.resolve(attributes) }
  # let(:user) { User.create!(signup_attributes[:attributes].to_h) }
  let(:signup_attributes) do
    {
      attributes: {
        first_name: 'Ava',
        last_name: 'Mcclure',
        email: 'ava.mcclure@gmail.com',
        password: '[Omitted]'
      }
    }
  end

  describe 'Success' do
    before do
      User.create!(signup_attributes[:attributes].to_h)
    end

    context 'when login attributes are valid' do
      let(:attributes) do
        {
          attributes: {
            email: 'ava.mcclure@gmail.com',
            password: '[Omitted]'
          }
        }
      end

      it { expect(result[:errors]).to be_empty }
      it { expect(result[:user][:tokens]).to be_empty }
      it { expect(result[:message]).to eq('Successful Login') }
    end
  end

  describe 'Failure' do
    before do
      User.create!(signup_attributes[:attributes].to_h)
    end

    context 'when one of the passed attributes is invalid' do
      let(:attributes) do
        {
          attributes: {
            email: nil,
            password: '[Omitted]'
          }
        }
      end

      it 'de' do
        binding.pry
      end

      it { expect(result[:errors]).to eq(["First name can't be blank"]) }
      it { expect(result[:user][:tokens]).to be_empty }
      it { expect(result[:message]).to eq('Login Unsuccessful') }
    end

    context 'when the password is wrong' do
      let(:attributes) do
        {
          attributes: {
            email: 'ava.mcclure@gmail.com',
            password: '[Omitted]'
          }
        }
      end

      it { expect(result[:errors]).to eq(["First name can't be blank", "Last name can't be blank"]) }
    end
  end
end
