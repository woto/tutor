class User::AvatarController < ApplicationController
  before_action :set_user_avatar_form, only: [:update]

  def update
    respond_to do |format|
      if @user_avatar_form.call(user_avatar_params)
        format.js
      end
    end
  end

  private

  def set_user_avatar_form
    @user_avatar_form = UserAvatarForm.new(current_user)
  end

  def user_avatar_params
    params.require(:user_avatar_form).permit(:avatar, :remote_avatar_url)
  end
end

