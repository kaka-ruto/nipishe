# frozen_string_literal: true

RSpec.describe Mutations::SchoolMutation do
  describe 'Creating a new school' do
    let(:mutation) { subject.fields['create_school'].resolve(nil, args, nil) }
    let(:args) do
      {
        name: 'University of Nairobi'
      }
    end

    it { expect(subject).to have_field(:create_school).that_returns(Types::SchoolType) }

    it 'increases school count by 1' do
      expect { mutation }.to change { School.count }.from(0).to(1)
    end
  end

  describe 'Editing a school' do
    let(:query_result) { subject.fields['edit_school'].resolve(nil, args, nil) }
    let(:school) { create(:school, name: 'Kyambogo University') }
    let(:args) do
      {
        id: school.id,
        name: 'Makerere University'
      }
    end

    it { expect(subject).to have_field(:edit_school).that_returns(Types::SchoolType) }

    it 'updates the school' do
      expect(query_result.name).to eq args[:name]
    end
  end

  describe 'Deleting a school' do
    let(:query_result) { subject.fields['delete_school'].resolve(nil, args, nil) }
    let!(:school) { create(:school) }
    let(:args) do
      {
        id: school.id
      }
    end

    it { expect(subject).to have_field(:delete_school).that_returns(Types::SchoolType) }

    it 'deletes the school' do
      expect(query_result).to eq('School has been successfully deleted')
    end

    it 'reduces school count by 1' do
      expect { query_result }.to change { School.count }.by(-1)
    end
  end
end
