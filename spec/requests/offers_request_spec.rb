require 'rails_helper'

RSpec.describe "Offers API", type: :request do
  # initialize test data
  let(:university) { create(:university) }
  let(:course) { create(:course, university: university) }
  let(:offers) { create_list(:offer, 10, course: course) }

  # Test suite for GET /offers
  describe 'GET /offers' do
    before { get '/offers' }

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end

    it 'returns offers' do
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end
  end
end
