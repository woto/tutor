class UserController < ApplicationController
  def update
    par = params.require(:user).permit!
    current_user.assign_attributes(par)
    current_user.valid?
    debugger
    current_user.save(validate: false)
  end
end
