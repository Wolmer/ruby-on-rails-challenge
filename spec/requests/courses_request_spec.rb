require 'rails_helper'

RSpec.describe "Courses API" do
  # # initialize test data
  let(:university) { create(:university) }
  let(:courses) { create_list(:course, 10, university: university) }

  # Test suite for GET /courses
  describe 'GET /courses' do
    before { get '/courses' }

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end

    it 'returns courses' do
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end
  end
end
