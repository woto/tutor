class Discipline < ActiveRecord::Base
  has_many :users_disciplines
  has_many :users, through: :users_disciplines

  validates :title, presence: true
end
