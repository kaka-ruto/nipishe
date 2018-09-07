# frozen_string_literal: true

RSpec.describe Mutations::SchoolMutation do
  describe 'Creating a new school' do
    let(:types) { GraphQL::Define::TypeDefiner.instance }
    let(:args) do
      {
        name: 'University of Nairobi'
      }
    end
    let(:mutation) { subject.fields['create_school'].resolve(nil, args, nil) }

    it { expect(subject).to have_field(:create_school).that_returns(types[Types::SchoolType]) }

    it 'increases school count by 1' do
      expect { mutation }.to (change { School.count }.from(0).to(1))
    end
  end
end
