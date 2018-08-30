# frozen_string_literal: true

RSpec.describe Types::QueryType do
  types = GraphQL::Define::TypeDefiner.instance

  # Schools
  describe 'Get all schools' do
    let!(:schools) { create_list(:school, 2) }

    it { expect(subject).to have_field(:schools).that_returns(!types[Types::SchoolType]) }

    it 'Returns all created schools' do
      query_result = subject.fields['schools'].resolve(nil, nil, nil)

      expect(query_result.to_a).to eq(schools)
    end
  end

  describe 'Get one school' do
    let(:school) { create(:school) }

    it { expect(subject).to have_field(:school).that_returns(!types[Types::SchoolType]) }

    it 'Returns the queried school' do
      args = { id: school.id }
      query_result = subject.fields['school'].resolve(nil, args, nil)

      expect(query_result).to eq(school)
    end
  end

  # Faculties
  describe 'Get all faculties' do
    let!(:faculties) { create_list(:faculty, 2) }

    it { expect(subject).to have_field(:faculties).that_returns(!types[Types::FacultyType]) }

    it 'Returns all created faculties' do
      query_result = subject.fields['faculties'].resolve(nil, nil, nil)

      expect(query_result.to_a).to eq(faculties)
    end
  end

  describe 'Get one faculty' do
    let(:faculty) { create(:faculty) }

    it { expect(subject).to have_field(:faculty).that_returns(!types[Types::FacultyType]) }

    it 'Returns the queried faculty' do
      args = { id: faculty.id }
      query_result = subject.fields['faculties'].resolve(nil, args, nil)

      expect(query_result).to eq(faculty)
    end
  end
end
