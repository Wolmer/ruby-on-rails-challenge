class CoursesController < ApplicationController
  before_action :index

  # GET /courses
  def index
    # data     = []
    @courses = Course.all
    json_response(toJson(@courses))
  end

  private

  def toJson(courses)
    data     = []
    courses.each do |course|
      course.campus.map() do |campus|
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

    return data
  end
end