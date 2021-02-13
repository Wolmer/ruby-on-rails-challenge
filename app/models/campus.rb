class Campus < ApplicationRecord
  # model association
  belongs_to :university
  has_and_belongs_to_many :course

  # validations
  validates_presence_of :name, :city
end
