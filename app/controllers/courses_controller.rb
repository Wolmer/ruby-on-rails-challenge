class CoursesController < ApplicationController
  before_action :index

  # GET /courses
  def index
    @cache_key = get_cache_key()
    @courses   = Course.filter(availableParams)
  end

  private

  def availableParams()
    params.slice(:university, :kind, :level, :shift)
  end
end
