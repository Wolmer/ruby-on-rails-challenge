json.cache! ['v1', @cache_key], expires_in: 60.minutes do
  json.array! @courses do |course|
    course.campus.each do |campus|
      json.course do
        json.name  course.name
        json.kind  course.kind
        json.level course.level
        json.shift course.shift
        json.university do
          json.name     course.university.name
          json.score    course.university.score
          json.logo_url course.university.logo_url
        end
        json.campus do
          json.name campus.name
          json.city campus.city
        end
      end
    end
  end
end