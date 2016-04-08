class Discipline < ActiveRecord::Base
  has_many :users_disciplines
  has_many :users, through: :users_disciplines
  has_many :discipline_areas

  validates :title, presence: true

  searchkick match: :word_start, searchable: [:title]
end
