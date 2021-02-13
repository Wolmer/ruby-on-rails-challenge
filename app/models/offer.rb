class Offer < ApplicationRecord
  # model association
  belongs_to :course

  # validations
  validates_presence_of :price_with_discount, :discount_percentage, :enrollment_semester, :enabled, :start_date
end
