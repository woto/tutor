class Discipline < ActiveRecord::Base
  has_many :disciplines_users
  has_many :users, through: :disciplines_users

  validates :title, presence: true
end
