# frozen_string_literal: true

RSpec.describe QueryTypes::UserQueryType do
  types = GraphQL::Define::TypeDefiner.instance

  describe 'Get all users' do
    let!(:users) { create_list(:user, 2) }

    it { expect(subject).to have_field(:users).that_returns(types[Types::UserType]) }

    it 'Returns all created users' do
      query_result = subject.fields['users'].resolve(nil, nil, nil)

      expect(query_result.to_a).to eq(users)
    end
  end

  describe 'Get one user' do
    let(:user) { create(:user) }

    it { expect(subject).to have_field(:user).that_returns(Types::UserType) }

    it 'Returns the queried user' do
      args = { id: user.id }
      query_result = subject.fields['user'].resolve(nil, args, nil)

      expect(query_result).to eq(user)
    end
  end
end
