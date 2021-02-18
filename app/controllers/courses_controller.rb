class CoursesController < ApplicationController
  before_action :index

  # GET /courses
  def index
    json_response(
      Rails.cache.fetch(get_cache_key()) do
        getData()
      end
    )
  end

  private

  def availableParams()
    params.slice(:university, :kind, :level, :shift)
  end

  def getData()
    data = []

    Course.filter(availableParams).each do |course|
      course.campus.each() do |campus|
        data.push({
          course: {
            name: course.name,
            kind: course.kind,
            level: course.level,
            shift: course.shift,
            university: {
              name: course.university.name,
              score: course.university.score,
              logo_url: course.university.logo_url
            },
            campus: {
              name: campus.name,
              city: campus.city
            }
          }
        })
      end
    end
    
    data
  end
end
