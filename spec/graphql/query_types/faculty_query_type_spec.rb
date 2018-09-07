# frozen_string_literal: true

RSpec.describe QueryTypes::FacultyQueryType do
  types = GraphQL::Define::TypeDefiner.instance

  describe 'Get all faculties' do
    let!(:faculties) { create_list(:faculty, 2) }

    it { expect(subject).to have_field(:faculties).that_returns(types[Types::FacultyType]) }

    it 'Returns all created faculties' do
      query_result = subject.fields['faculties'].resolve(nil, nil, nil)

      expect(query_result.to_a).to eq(faculties)
    end
  end

  describe 'Get one faculty' do
    let(:faculty) { create(:faculty) }

    it { expect(subject).to have_field(:faculty).that_returns(Types::FacultyType) }

    it 'Returns the queried faculty' do
      args = { id: faculty.id }
      query_result = subject.fields['faculty'].resolve(nil, args, nil)

      expect(query_result).to eq(faculty)
    end
  end
end
