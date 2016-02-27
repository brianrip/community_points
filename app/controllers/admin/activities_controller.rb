class Admin::ActivitiesController < Admin::BaseController

  def new
    @activity = Activity.new
  end

  def create
    @activity = Activity.new(activity_params)
    if @activity.save
      redirect_to admin_users_path
    else
      flash.now[:error] = "Invalid Activity"
      render :new
    end
  end

  private

  def activity_params
    params.require(:activity).permit(:title, :points)
  end

end
