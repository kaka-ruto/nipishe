# frozen_string_literal: true

RSpec.describe Types::Inputs::Users::Login do
  let(:user) { described_class }

  types = GraphQL::Define::TypeDefiner.instance

  it { expect(user).to have_input_field(:email).of_type(!types.String) }
  it { expect(user).to have_input_field(:password).of_type(!types.String) }
end
