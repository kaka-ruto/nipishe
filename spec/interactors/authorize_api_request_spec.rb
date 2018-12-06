require 'spec_helper'

RSpec.describe AuthorizeApiRequest, type: :interactor do
  subject(:context) { described_class.call(headers: headers) }

  let(:user) { create(:user) }

  describe 'Success' do
    context 'when valid request' do
      let(:headers) { { 'Authorization' => token_generator(user.id) } }

      it 'passes context' do
        expect(context).to be_success
      end

      it 'returns user object' do
        # binding.pry
        expect(context[:user]).to eq(user)
      end
    end
  end

  describe 'failure' do
    context 'when invalid request' do
      context 'when missing token' do
        let(:headers) { {} }

        it 'fails context' do
          expect(context).to be_failure
        end

        it 'raises a missing token error' do
          expect(context[:error]).to eq('Missing token')
        end
      end

      context 'when invalid token' do
        let(:headers) { { 'Authorization' => token_generator(1) + 'blah!' } }

        it 'fails context' do
          expect(context).to be_failure
        end

        it 'raises an invalid token error' do
          expect(context[:error]).to eq('Invalid token')
          # TODO expect to raise exception instead
          # expect(context).to raise_error(Errors::ExceptionHandler::InvalidToken,
          #   'Signature verification raised')
        end
      end

      context 'when expired token' do
        let(:headers) { { 'Authorization' => expired_token_generator(user.id) } }

        it 'fails context' do
          expect(context).to be_failure
        end

        it 'raises an expired signature error' do
          expect(context[:error]).to eq('Invalid token')
          # TODO expect to raise exception instead
          # expect(context).to raise_error(Errors::ExceptionHandler::InvalidToken,
          #   'Signature has expired')
        end
      end

      context 'when fake token' do
        let(:headers) { { 'Authorization' => 'F0ob@r' } }

        it 'fails context' do
          expect(context).to be_failure
        end

        it 'raises a JWT decode error' do
          expect(context[:error]).to eq('Invalid token')
          # TODO expect to raise exception instead
          # expect(result).to raise_error(Errors::ExceptionHandler::InvalidToken,
          #   'Not enough or too many segments')
        end
      end
    end
  end
end
