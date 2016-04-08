class DisciplineArea < ApplicationRecord
  belongs_to :discipline
  searchkick match: :word_start, searchable: [:title]
end
