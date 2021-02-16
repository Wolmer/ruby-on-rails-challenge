require 'json'

file   = File.read("#{__dir__}/db.json")
offers = JSON.parse(file)

offers.each do |offer| 
  universityData = {
    name: offer['university']['name'],
    score: offer['university']['score'],
    logo_url: offer['university']['logo_url']
  }

  university = University.where(universityData)
  university = university.any? ? university.first : University.create!(universityData)

  campusData = {
    university_id: university.id,
    name: offer['campus']['name'],
    city: offer['campus']['city']
  }

  campus = Campus.where(campusData)
  campus = campus.any? ? campus.first : Campus.create!(campusData)

  courseData = {
    university_id: university.id,
    name: offer['course']['name'],
    kind: offer['course']['kind'],
    level: offer['course']['level'],
    shift: offer['course']['shift'],
    price: offer['full_price']
  }

  course = Course.where(courseData)
  course = course.any? ? course.first : Course.create!(courseData)
  course.campus << campus
  
  offerData = {
    course_id: course.id,
    price_with_discount: offer['price_with_discount'],
    discount_percentage: offer['discount_percentage'],
    enrollment_semester: offer['enrollment_semester'],
    enabled: offer['enabled'],
    start_date: offer['start_date']
  }

  unless Offer.where(offerData).any?
    Offer.create!(offerData)
  end
end
