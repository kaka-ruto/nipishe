# frozen_string_literal: true

RSpec.describe Types::AuthType do
  types = GraphQL::Define::TypeDefiner.instance

  it { expect(subject).to have_field(:api_token).that_returns(!types.String) }
end
