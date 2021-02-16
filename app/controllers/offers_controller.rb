class OffersController < ApplicationController
  before_action :index

  # GET /offers
  def index
    orderBy   = params[:order_by] ? params[:order_by] : 'id'
    direction = params[:direction] ? params[:direction] : 'asc'
    @offers   = Offer
      .filter(params.slice(:university, :course, :kind, :level, :shift, :city))
      .order("#{orderBy} #{direction}")

    json_response(toJson(@offers))
  end

  private

  def toJson(offers)
    data = []
    offers.each do |offer|
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
