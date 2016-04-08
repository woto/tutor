class User::AvatarCropController < ApplicationController
  before_action :set_user_avatar_crop_form, only: [:update]

  def update
    respond_to do |format|
      if @user_avatar_crop_form.call(user_avatar_crop_params)
        format.js
      end
    end
  end

  private

  def set_user_avatar_crop_form
    @user_avatar_crop_form = UserAvatarCropForm.new(current_user)
  end

  def user_avatar_crop_params
    params.require(:user_avatar_crop_form).permit(:x, :y, :w, :h)
  end
end
