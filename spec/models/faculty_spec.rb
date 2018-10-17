# frozen_string_literal: true

# == Schema Information
#
# Table name: faculties
#
#  id              :bigint(8)        not null, primary key
#  date_of_opening :string
#  name            :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  school_id       :bigint(8)
#
# Indexes
#
#  index_faculties_on_school_id  (school_id)
#
# Foreign Keys
#
#  fk_rails_...  (school_id => schools.id)
#


RSpec.describe Faculty, type: :model do
  let(:school) { create(:school) }
  let(:attributes) do
    {
      name: 'Engineering',
      date_of_opening: '2011'
    }
  end
  let(:faculty) { create(:faculty, **attributes) }

  describe 'Vaidations' do
    it { expect(faculty).to allow_value(attributes[:name]).for(:name) }
    it { expect(faculty).to allow_value(attributes[:date_of_opening]).for(:date_of_opening) }

    it { expect(faculty).to validate_presence_of(:name) }
    it { expect(faculty).to validate_uniqueness_of(:name) }
  end

  describe 'Associations' do
    it { expect(faculty).to belong_to(:school) }
  end
end
