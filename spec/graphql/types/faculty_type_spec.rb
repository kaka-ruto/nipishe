# frozen_string_literal: true

RSpec.describe Types::FacultyType do
  types = GraphQL::Define::TypeDefiner.instance

  it { expect(subject).to have_field(:id).that_returns(!types.ID) }
  it { expect(subject).to have_field(:name).that_returns(!types.String) }
  it { expect(subject).to have_field(:date_of_opening).that_returns(types.String) }
end
