# frozen_string_literal: true

RSpec.describe Types::Inputs::Users::UserCreationInputType do
  subject(:user) { described_class }

  let(:types) { GraphQL::Define::TypeDefiner.instance }

  it { expect(user).to have_input_field(:first_name).of_type(types.String) }
  it { expect(user).to have_input_field(:last_name).of_type(types.String) }
  it { expect(user).to have_input_field(:email).of_type(!types.String) }
  it { expect(user).to have_input_field(:password).of_type(!types.String) }
end
