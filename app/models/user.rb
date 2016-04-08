class User < ActiveRecord::Base
  searchkick suggest: [:email]
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  include UserAvatarValidations

  has_many :users_disciplines, class_name: "UsersDisciplines"
  has_many :disciplines, through: :users_disciplines
  has_many :locations

  def to_param
    [id, first_name, last_name.to_s[0]].join('-').parameterize
  end

end
