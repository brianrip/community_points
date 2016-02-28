class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @activities = Activity.all
    @user_activity = UserActivity.new
  end

  def create
    @user = User.find(params[:user_activity][:id])
    @activity = Activity.find(params[:user_activity][:id])
    @user_activity = UserActivity.create(user_id: @user.id, activity_id: @activity.id)
    redirect_to user_path(@user)
    require 'pry', binding.pry
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end
end




# @user_activity = current_user.user_activities.find(params[:id])
