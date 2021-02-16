class Offer < ApplicationRecord
  include Filterable
  
  # model association
  belongs_to :course

  # validations
  validates_presence_of :price_with_discount, :discount_percentage, :enrollment_semester, :start_date

  scope :filter_by_kind,       -> (kind)  { joins(:course).where("kind like ?", "#{kind}%") }
  scope :filter_by_level,      -> (level) { joins(:course).where("level like ?", "#{level}%") }
  scope :filter_by_shift,      -> (shift) { joins(:course).where("shift like ?", "#{shift}%") }
  scope :filter_by_course,     -> (name)  { joins(:course).where("courses.name like ?", "#{name}%") }
  scope :filter_by_city,       -> (city)  { joins(course: :campus).where("campuses.city like ?", "#{city}%") }
  scope :filter_by_university, -> (name)  { joins(course: :university).where("universities.name like ?", "#{name}%") }

  scope :price_with_discount_order, ->{ order(:price_with_discount) }
  scope :reverse_price_with_discount_order, ->{ order(price_with_discount: :desc) }
end