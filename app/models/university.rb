class University < ApplicationRecord
    # model association
    has_many :campus, dependent: :destroy
    has_many :course, dependent: :destroy

    # validations
    validates_presence_of :name, :score, :logo_url
end
