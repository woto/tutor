module UsersDisciplinesValidations
  extend ActiveSupport::Concern

  included do
    validates :discipline_year, inclusion: {in: Constants::YEARS.map(&:last), message: 'please choose year'}
    validates :discipline_grade, numericality: true
  end
end
