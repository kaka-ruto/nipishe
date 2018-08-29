# frozen_string_literal: true

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
