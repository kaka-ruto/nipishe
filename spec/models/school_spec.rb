# frozen_string_literal: true

# == Schema Information
#
# Table name: schools
#
#  id               :bigint(8)        not null, primary key
#  name             :string
#  type_of_school   :string
#  year_of_founding :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#


RSpec.describe School, type: :model do
  let(:attributes) do
    {
      name: 'Kenyatta University',
      type_of_school: 'University',
      year_of_founding: '1938'
    }
  end
  let(:school) { create(:school, **attributes) }

  describe 'Validations' do
    it { expect(school).to allow_value(attributes[:name]).for(:name) }
    it { expect(school).to allow_value(attributes[:type_of_school]).for(:type_of_school) }
    it { expect(school).to allow_value(attributes[:year_of_founding]).for(:year_of_founding) }

    it { expect(school).to validate_presence_of(:name) }
    it { expect(school).to validate_uniqueness_of(:name) }
  end

  describe 'Associations' do
    it { expect(school).to have_many(:faculties) }
  end
end
