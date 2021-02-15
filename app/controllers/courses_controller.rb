class CoursesController < ApplicationController
  before_action :index

  # GET /courses
  def index
    @courses = Course.all
    json_response(@courses)
  end
end