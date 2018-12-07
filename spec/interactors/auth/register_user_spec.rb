# frozen_string_literal: true

RSpec.describe Auth::RegisterUser, type: :interactor do
  subject(:context) { described_class.call(attributes: signup_attributes) }

  describe 'Success' do
    context 'when signup attributes are valid' do
      let(:signup_attributes) do
        {
          first_name: 'Ava',
          last_name: 'Mcclure',
          email: 'ava.mcclure@gmail.com',
          password: '[Omitted]'
        }
      end

      it 'passes context' do
        expect(context).to be_success
      end

      it 'creates a new user' do
        expect{ context }.to change(User, :count).from(0).to(1)
      end

      # it 'calls JsonWebToken.encode' do
      #   context
      #   expect(JsonWebToken).to have_received(:encode)
      #     .with(user_id: context.user.id)
      #     .once
      # end

      it 'creates the auth_token' do
        expect(context[:auth_token]).not_to be_nil
      end
    end
  end

  describe 'failure' do
    context 'when signup email is invalid' do
      # TODO: validate email
      let(:signup_attributes) do
        {
          attributes: {
            first_name: 'Ava',
            last_name: 'Mcclure',
            email: 'gmail.com',
            password: '[Omitted]'
          }
        }
      end

      it 'fails context' do
        expect(context).to be_failure
      end

      it 'raises ActiveRecord::RecordInvalid exception' do
        expect(context).to raise ActiveRecord::RecordInvalid
      end

      it 'throws a validation failed error' do
        # binding.pry
        expect(context[:error]).to eq('Validation failed: Email invalid')
      end
    end
  end
end
