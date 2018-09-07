# frozen_string_literal: true

RSpec.describe QueryTypes::SchoolQueryType do
  types = GraphQL::Define::TypeDefiner.instance

  describe 'Get all schools' do
    let!(:schools) { create_list(:school, 2) }

    it { expect(subject).to have_field(:schools).that_returns(types[Types::SchoolType]) }

    it 'Returns all created schools' do
      query_result = subject.fields['schools'].resolve(nil, nil, nil)

      expect(query_result.to_a).to eq(schools)
    end
  end

  describe 'Get one school' do
    let(:school) { create(:school) }

    it { expect(subject).to have_field(:school).that_returns(Types::SchoolType) }

    it 'Returns the queried school' do
      args = { id: school.id }
      query_result = subject.fields['school'].resolve(nil, args, nil)

      expect(query_result).to eq(school)
    end
  end
end
