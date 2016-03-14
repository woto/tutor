class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  mount_uploader :avatar, AvatarUploader

  has_many :users_disciplines, class_name: "UsersDisciplines"
  has_many :disciplines, through: :users_disciplines
  has_many :locations

  validates :last_name, presence: true

  def to_param
    [id, first_name, last_name.to_s[0]].join('-').parameterize
  end
end
