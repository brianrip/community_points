class Admin::RewardsController < Admin::BaseController
  def new
    @reward = Reward.new
  end

  def create
    @reward = Reward.new(reward_params)
    if @reward.save
      flash[:message] = "Reward has been created!"
      redirect_to admin_users_path
    else
      flash.now[:error] = "Invalid Input"
      render :edit
    end
  end

  def destroy
    @reward = Reward.find(params[:id])
    @reward.delete
    flash[:message] = "Reward has been deleted"
    redirect_to admin_users_path
  end

  def edit
    @reward = Reward.find(params[:id])
  end

  def update
    @reward = Reward.find(params[:id])
    if @reward.update(reward_params)
      redirect_to admin_users_path
    else
      flash.now[:error] = "Invalid Input"
      render :edit
    end
  end

  private

  def reward_params
    params.require(:reward).permit(:name, :description, :point_cost)
  end
end
