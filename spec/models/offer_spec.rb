require 'rails_helper'

RSpec.describe Offer, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:course) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:price_with_discount) }
    it { is_expected.to validate_presence_of(:discount_percentage) }
    it { is_expected.to validate_presence_of(:enrollment_semester) }
    it { is_expected.to validate_presence_of(:enabled) }
    it { is_expected.to validate_presence_of(:start_date) }
  end
end
