class TestsController < ApplicationController

  def edit
    respond_to do |format|
      format.html
    end
  end

  def update
    respond_to do |format|
      if current_user.update(user_params)
        format.html { redirect_to edit_test_path }
      else
        format.html { render 'edit' }
      end
    end
  end

  private

  def user_params
    params.require(:user).permit!
  end

end

