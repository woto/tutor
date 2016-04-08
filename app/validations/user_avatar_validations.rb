module UserAvatarValidations

  extend ActiveSupport::Concern

  included do
    mount_uploader :avatar, AvatarUploader
  end

end
