class User::RequestController < ApplicationController

  before_action :set_request_form, only: [:edit, :update]

  def edit
    @request_form.prepopulate_request_form!
  end

  def update
    respond_to do |format|
      if @request_form.call(request_params)
        format.html { redirect_to(public_user_profile_path(current_user), notice: 'Deal with that')}
      else
        format.html { render 'edit' }
      end
    end
  end

  private

  def set_request_form
    @request_form = User::RequestForm.new(current_user)
  end

  def request_params
    params.require(:user_request_form).permit!
  end

end
