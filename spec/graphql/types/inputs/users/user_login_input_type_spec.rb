# frozen_string_literal: true

RSpec.describe Types::Inputs::Users::UserLoginInputType do
  types = GraphQL::Define::TypeDefiner.instance

  it { expect(subject).to have_input_field(:email).of_type(!types.String) }
  it { expect(subject).to have_input_field(:password).of_type(!types.String) }
end
