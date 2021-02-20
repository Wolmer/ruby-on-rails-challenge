require 'rails_helper'

RSpec.describe "Offers API", type: :request do
  # Test suite for GET /offers
  describe 'GET /offers' do
    # initialize test data
    let!(:user)       { create(:user) }
    let!(:university) { build(:university) }
    let!(:campus)     { create(:campus, university: university) }
    let!(:course)     { create(:course, university: university, campus: [campus]) }
    let!(:offers)     { create_list(:offer, 10, course: course) }
    let!(:headers)    { valid_headers }

    before { get '/offers', headers: headers }

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end

    it 'returns offers' do
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it 'returns response json' do
      expect(response.header['Content-Type']).to include( 'application/json')
    end

    it 'responds with JSON' do
      expect(response).to match_response_schema("offer")
    end
  end
end
