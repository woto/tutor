class DisciplinesUser < ActiveRecord::Base
  attr_accessor :active

  enum discipline_year: Constants::YEARS

  belongs_to :discipline, required: true
  belongs_to :user, required: true

  validates :discipline_areas, presence: true
  validates :discipline_year, inclusion: { in: Constants::YEARS.map{|y| y.first.to_s} }
end
