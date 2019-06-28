# frozen-string_literal: true

RSpec.describe Mutations::Users::Logout, type: :request do
  subject(:logout) do
    post '/graphql', params: { query: query(user_id: logged_in_user.id) }
  end

  let(:attributes) {{ email: 'one@two.com', password: '@vat@r' }}
  let(:new_user) { create(:user, email: attributes[:email],
                                 password: attributes[:password]) }
  let(:logged_in_user) { login_user(new_user) }

  describe '.resolve' do
    context 'when successful' do
      it 'returns a logout successful message' do
        logout
        json = JSON.parse(response.body)
        data = json['data']['logout']

        expect(data).to include('message' => 'Successfully Signed Out')
      end
    end
  end

  def login_user(new_user)
    ::Users::Login.call(attributes: attributes).user
  end

  def query(user_id:)
    <<~GQL
      mutation {
        logout(
          userId: #{user_id}
        ) {
          message
        }
      }
    GQL
  end
end

