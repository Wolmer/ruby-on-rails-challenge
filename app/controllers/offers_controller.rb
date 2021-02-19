class OffersController < ApplicationController
  before_action :index

  # GET /courses
  def index
    orderBy   = availableParams[:order_by] ? availableParams[:order_by] : 'id'
    direction = availableParams[:direction] ? availableParams[:direction] : 'asc'

    @cache_key = get_cache_key()
    @offers    = Offer
      .filter(availableParams.except(:order_by, :direction))
      .order("#{orderBy} #{direction}")
  end

  private

  def availableParams()
    params.slice(
      :university, :course, :kind, :level, :shift, :city, :order_by, :direction
    )
  end
end
