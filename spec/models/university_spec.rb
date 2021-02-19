require 'rails_helper'

RSpec.describe University, type: :model do
  describe 'associations' do
    it { is_expected.to have_many(:campus).dependent(:destroy) }
    it { is_expected.to have_many(:course).dependent(:destroy) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:score) }
    it { is_expected.to validate_presence_of(:logo_url) }
  end
end
