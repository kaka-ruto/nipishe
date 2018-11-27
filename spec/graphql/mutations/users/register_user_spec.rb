# frozen_string_literal: true

RSpec.describe Mutations::Users::RegisterUser do
  let(:subject) { described_class.new(object: nil, context: nil) }
  let(:result) { subject.resolve(attributes) }

  describe 'Success' do
    context 'when the passed attributes are valid' do
      let(:attributes) do
        {
          attributes: {
            first_name: 'Ava',
            last_name: 'Mcclure',
            email: 'ava.mcclure@gmail.com',
            password: 'Hatahuezikajua'
          }
        }
      end


      it { expect { result }.to (change { User.count }).from(0).to(1) }
      it { expect(result[:user]).to be_persisted }
      it { expect(result[:errors]).to be_empty }
      it { expect(result[:user][:tokens]).not_to be_nil }
      it { expect(result[:message]).to eq('Successful Sign Up') }
    end
  end

  describe 'Failure' do
    context 'when one of the passed attributes is invalid' do
      let(:attributes) do
        {
          attributes: {
            first_name: nil,
            last_name: 'Mcclure',
            email: 'ava.mcclure@gmail.com',
            password: 'Hatahuezikajua'
          }
        }
      end

      it 'me' do
        binding.pry
      end

      it { expect { result }.not_to (change { User.count }) }
      it { expect(result[:user]).not_to be_persisted }
      it { expect(result[:errors]).to eq(["First name can't be blank"]) }
      it { expect(result[:user][:tokens]).to be_an_empty_hash }
      it { expect(result[:message]).to eq('Sign Up Unsuccessful') }
    end

    context 'when two or more of the passed attributes are invalid' do
      let(:attributes) do
        {
          attributes: {
            first_name: '',
            last_name: nil,
            email: 'ava.mcclure@gmail.com',
            password: '[Omitted]'
          }
        }
      end

      it { expect(result[:errors]).to eq(["First name can't be blank", "Last name can't be blank"]) }
    end
  end
end
