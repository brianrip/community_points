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
      
    end
  end

  private

  def reward_params
    params.require(:reward).permit(:name, :description, :point_cost)
  end
end
