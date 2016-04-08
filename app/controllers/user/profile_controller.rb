class User::ProfileController < ApplicationController

  before_action :set_user_profile_form, only: [:edit, :update]
  before_action :set_user_avatar_form, only: [:edit, :update]
  before_action :set_user_avatar_crop_form, only: [:edit, :update]

  def show
  end

  def edit
    @user_profile_form.prepopulate_user_profile_form!
  end

  def update
    respond_to do |format|
      if @user_profile_form.call(user_profile_params)
        format.html { redirect_to(public_user_profile_path(current_user), notice: 'Profile was successfully updated')}
      else
        format.html { render 'edit' }
      end
    end
  end

  private

  def set_user_profile_form
    @user_profile_form = UserProfileForm.new(current_user)
  end

  def set_user_avatar_form
    @user_avatar_form = UserAvatarForm.new(current_user)
  end

  def set_user_avatar_crop_form
    @user_avatar_crop_form = UserAvatarCropForm.new(current_user)
  end

  def user_profile_params
    params.require(:user_profile_form).permit(:undergraduate_school, :graduate_school, :school_year,
      :teach_fee, :first_name, :last_name, :location, :avatar, :about, :phone, :skype,
      :users_disciplines_form_attributes => [:id, :active, :discipline_id, :discipline_areas,
                                             :discipline_year, :discipline_grade, :discipline_type])
  end

end
