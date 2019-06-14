# frozen_string_literal: true
require 'action_policy/rspec'

RSpec.describe Mutations::Users::UpdateProfile do
  subject(:profile) do
    described_class.new(object: nil, 
                        context: { 'current_user': user })
  end

  describe '.resolve' do
    # Success
    let(:new_attributes) do
      {
        date_of_birth: '00-00-1967',
        gender: 'Male',
        last_name: 'Ruto'
      }
    end

    context "when the user is authorized" do
      let(:user) { create(:user) }

      it "is authorized" do
        result = profile.resolve(id: user.id, attributes: new_attributes)
        expect {
          result
        }.to be_authorized_to(:update?, user).with(Users::UserPolicy)
      end


      it 'updates the user' do
        result = profile.resolve(id: user.id, attributes: new_attributes)
        expect(result.user).to have_attributes(new_attributes)
      end
    end

    # Failure
    context 'when the user is not authorized' do
      let(:user) { create(:user) }
      let(:second_user) { create(:user) }

      it 'raises a GraphQL::ExecutionError message' do
        result = profile.resolve(id: second_user.id, attributes: new_attributes)
        
        expect { result }.to raise_error(GraphQL::ExecutionError)
      end

      it 'does not update the user' do
        expect(user).not_to have_attributes new_attributes
      end
    end
  end
end
