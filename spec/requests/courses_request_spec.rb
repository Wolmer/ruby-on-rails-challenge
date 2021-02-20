require 'rails_helper'

RSpec.describe 'Courses API', type: :request do
  # Test suite for GET /courses
  describe 'GET /courses' do
    # initialize test data
    let!(:user)       { create(:user) }
    let!(:university) { build(:university) }
    let!(:campus)     { create(:campus, university: university) }
    let!(:courses)    { create_list(:course, 10, university: university, campus: [campus]) }
    let!(:headers)    { valid_headers }
    
    before { get '/courses', headers: valid_headers }

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end

    it 'returns courses' do
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end
  end
end
