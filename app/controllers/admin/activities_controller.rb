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

  def edit
    @activity = Activity.find(params[:id])
  end

  def update
    @activity = Activity.find(params[:id])
    if @activity.update(activity_params)
      redirect_to admin_users_path
    else
      flash.now[:error] = "Invalid Activity"
      render :edit
    end
  end

  private

  def activity_params
    params.require(:activity).permit(:title, :points)
  end

end
