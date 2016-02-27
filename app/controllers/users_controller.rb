class UsersController < ApplicationController
  # before_action :require_login
  #
  # def require_login
  #   redirect_to login_path unless current_user
  # end
  #
  
  private

  def user_params
    params.require(:user).permit(:username, :password)
  end
end




# @user_activity = current_user.user_activities.find(params[:id])
