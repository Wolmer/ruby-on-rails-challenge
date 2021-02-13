require 'rails_helper'

RSpec.describe Campus, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:university) }
    it { is_expected.to have_and_belong_to_many(:course) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:city) }
  end
end
