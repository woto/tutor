class Users::RegistrationsController < Devise::RegistrationsController

  # The path used after sign up.
  def after_sign_up_path_for(resource)
    edit_user_profile_path
  end

end
