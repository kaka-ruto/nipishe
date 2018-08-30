# frozen_string_literal: true

RSpec.describe Types::SchoolType do
  types = GraphQL::Define::TypeDefiner.instance

  it { expect(subject).to have_field(:id).that_returns(!types.ID) }
  it { expect(subject).to have_field(:name).that_returns(!types.String) }
  it { expect(subject).to have_field(:type_of_school).that_returns(types.String) }
  it { expect(subject).to have_field(:year_of_founding).that_returns(types.String) }

  it { expect(subject).to have_field(:faculties).that_returns(!types[Types::FacultyType]) }
end
