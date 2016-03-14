class User::ProfileController < ApplicationController

  before_action :set_user_profile, only: [:edit, :update]

  def show
  end

  def edit
    @user_profile.prepopulate_users_disciplines_form!
  end

  def update
    respond_to do |format|
      if @user_profile.call(user_profile_params)
        format.html { redirect_to(public_user_profile_path(current_user), notice: 'Profile was successfully updated')}
      else
        format.html { render 'edit' }
      end
    end
  end

  private

  def set_user_profile
    @user_profile = UserProfileForm.new(current_user)
  end

  def user_profile_params
    params.require(:user_profile).permit(:undergraduate_school, :graduate_school, :school_year,
      :teach_fee, :first_name, :last_name, :location, :avatar, :about,
      :users_disciplines_form_attributes => [:id, :active, :discipline_id, :discipline_areas,
                                             :discipline_year, :discipline_grade,:discipline_type])
  end

end
