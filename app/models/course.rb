class Course < ApplicationRecord
  include Filterable

  # model association
  has_many :offer
  belongs_to :university
  has_and_belongs_to_many :campus

  # validations
  validates_presence_of :name, :kind, :level, :shift, :price

  scope :filter_by_kind,       -> (kind)  { where("kind like ?", "#{kind}%")}
  scope :filter_by_level,      -> (level) { where("level like ?", "#{level}%")}
  scope :filter_by_shift,      -> (shift) { where("shift like ?", "#{shift}%")}
  scope :filter_by_university, -> (name)  { joins(:university).where("universities.name like ?", "#{name}%")}
end
