class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  enum school_year: Constants::YEARS

  mount_uploader :avatar, AvatarUploader

  has_many :disciplines_users#, -> { includes(:discipline).references(:discipline).order("disciplines.title") }
  has_many :disciplines, through: :disciplines_users
  has_many :locations

  def to_param
    [id, first_name, last_name.to_s[0]].join('-').parameterize
  end
end
