class UsersDisciplines < ActiveRecord::Base
  include UsersDisciplinesValidations

  enum discipline_type: [:teach, :learn]

  belongs_to :discipline, required: true
  belongs_to :user, required: true

  scope :ordered_by_discipline_title, -> { includes(:discipline).order('disciplines.title') }

  searchkick suggest: [:discipline_areas]
end
