class OffersController < ApplicationController
  before_action :index

  # GET /offers
  def index
    @offers = Offer.all
    json_response(@offers)
  end
end