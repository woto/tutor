class UsersDisciplines < ActiveRecord::Base
  enum discipline_type: [:teach, :learn]

  belongs_to :discipline, required: true
  belongs_to :user, required: true

  scope :ordered_by_discipline_title, -> { includes(:discipline).order('disciplines.title') }

  validates :discipline_year, inclusion: {in: Constants::YEARS.map(&:last), message: 'please choose year'}
  validates :discipline_grade, numericality: true
end
