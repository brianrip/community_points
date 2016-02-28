class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @activities = Activity.all
    @user_activity = UserActivity.new
    @user_activities = @user.activities.all
  end

  def create
    @user = User.find(params[:id])
    @activities = Activity.all
    # @user_activity = UserActivity.new(params[:activity_id], params[:user_id])
    @user_activity = UserActivity.create(user_id: params[:id], activity_id: params[:user_activity][:activity_id])

    redirect_to user_path(@user)
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end
end




# @user_activity = current_user.user_activities.find(params[:id])
