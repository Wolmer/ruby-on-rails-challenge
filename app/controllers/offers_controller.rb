class OffersController < ApplicationController
  before_action :index

  include ApiCache

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
    params.slice(
      :university, :course, :kind, :level, :shift, :city, :order_by, :direction
    )
  end

  def getData()
    data      = []
    orderBy   = availableParams[:order_by] ? availableParams[:order_by] : 'id'
    direction = availableParams[:direction] ? availableParams[:direction] : 'asc'

    Offer
      .filter(availableParams.except(:order_by, :direction))
      .order("#{orderBy} #{direction}")
      .each do |offer|
        offer.course.campus.each() do |campus|
          data.push({
            full_price: offer.course.price,
            price_with_discount: offer.price_with_discount,
            discount_percentage: offer.discount_percentage,
            start_date: offer.start_date,
            enrollment_semester: offer.enrollment_semester,
            enabled: offer.enabled,
            course: {
              name: offer.course.name,
              kind: offer.course.kind,
              level: offer.course.level,
              shift: offer.course.shift
            },
            university: {
              name: offer.course.university.name,
              score: offer.course.university.score,
              logo_url: offer.course.university.logo_url
            },
            campus: {
              name: campus.name,
              city: campus.city
            }
          })
        end
      end
    
    data
  end
end
