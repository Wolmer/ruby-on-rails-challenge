class CoursesController < ApplicationController
  before_action :index

  # GET /courses
  def index
    @courses = Course.filter(params.slice(:university, :kind, :level, :shift))
    json_response(toJson(@courses))
  end

  private

  def toJson(courses)
    data = []
    courses.each do |course|
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
