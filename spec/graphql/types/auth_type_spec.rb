# frozen_string_literal: true

RSpec.describe Types::AuthType do
  subject(:auth) { described_class }

  types = GraphQL::Define::TypeDefiner.instance

  it { expect(auth).to have_field(:tokens).that_returns(!types.String) }
end
