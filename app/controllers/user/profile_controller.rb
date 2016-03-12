class User::ProfileController < ApplicationController

  before_action :find_user_profile, only: [:edit, :update]

  def show
  end

  def edit
    @user_profile.prepopulate!
  end

  def update
    respond_to do |format|
      validation_success = @user_profile.validate(user_profile_params)
      if validation_success
        @user_profile.save
        format.html { redirect_to(public_user_profile_path(current_user), notice: 'Profile was successfully updated')}
      else
        @user_profile.prepopulate!
        format.html { render 'edit' }
      end
    end
  end

  private

  def find_user_profile
    @user_profile = UserProfileForm.new(current_user)
  end

  def user_profile_params
    params.require(:user_profile).permit(:undergraduate_school, :graduate_school, :school_year,
                                         :teach_fee, :first_name, :last_name, :location, :avatar, :about,
                                         :disciplines_users_attributes => [:id, :active, :discipline_id, :discipline_areas, :discipline_year])
    #params.require(:user_profile).permit!
  end

end
