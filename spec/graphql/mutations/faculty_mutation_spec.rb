# frozen_string_literal: true

RSpec.describe Mutations::FacultyMutation do
  describe 'Creating a new faculty' do
    let(:mutation) { subject.fields['create_faculty'].resolve(nil, args, nil) }
    let(:school) { create(:school) }
    let(:args) do
      {
        school_id: school.id,
        name: 'The Amazing Faculty of Engineering'
      }
    end

    it { expect(subject).to have_field(:create_faculty).that_returns(Types::FacultyType) }

    context 'when successful' do
      it 'increases faculty count by 1' do
        expect { mutation }.to change { Faculty.count }.from(0).to(1)
      end
    end

    context 'when unsuccessful' do
      let(:school) { nil }

      it 'returns an error' do
        skip 'Unsuccessful update'
      end
    end
  end

  describe 'Editing a faculty' do
    let(:query_result) { subject.fields['edit_faculty'].resolve(nil, args, nil) }
    let(:school) { create(:school) }
    let(:faculty) { create(:faculty, school: school) }
    let(:args) do
      {
        school_id: school.id,
        faculty_id: faculty.id,
        name: 'The Institute of Engineering'
      }
    end

    it { expect(subject).to have_field(:edit_faculty).that_returns(Types::FacultyType) }

    context 'when successful' do
      it 'updates a faculty' do
        expect(query_result.name).to eq args[:name]
      end
    end
  end

  describe 'Deleting a faculty' do
    # Use ! to eager load (create) the items first, before deletion
    let(:context) { subject.fields['delete_faculty'].resolve(nil, args, nil) }
    let(:school) { create(:school) }
    let!(:faculty) { create(:faculty, school: school) }
    let(:args) do
      {
        school_id: school.id,
        faculty_id: faculty.id
      }
    end

    it { expect(subject).to have_field(:delete_faculty).that_returns(Types::FacultyType) }

    context 'when successful' do
      it 'reduces faculty count by 1' do
        expect { context }.to change { Faculty.count }.by(-1)
      end

      it 'returns a success message' do
        skip 'Successful deletion'
      end
    end
  end
end
