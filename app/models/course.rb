class Course < ApplicationRecord
  # model association
  has_many :offer
  belongs_to :university
  has_and_belongs_to_many :campus

  # validations
  validates_presence_of :name, :kind, :level, :shift, :price
end
