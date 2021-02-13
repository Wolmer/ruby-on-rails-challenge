require 'rails_helper'

RSpec.describe Course, type: :model do
  describe 'associations' do
    it { is_expected.to have_many(:offer) }
    it { is_expected.to belong_to(:university) }
    it { is_expected.to have_and_belong_to_many(:campus) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:kind) }
    it { is_expected.to validate_presence_of(:level) }
    it { is_expected.to validate_presence_of(:shift) }
    it { is_expected.to validate_presence_of(:price) }
  end
end
