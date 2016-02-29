class RewardsController < ApplicationController
  def index
    @rewards = Reward.all
  end

  def show
    @reward = Reward.find(params[:id])
  end

  def create    
    @reward = Reward.find(params[:id])
    @user = current_user
    user_reward = UserReward.create(reward_id: @reward.id, user_id: @user.id)
    @user.claim_reward(@reward.id)
    redirect_to user_path(@user)
  end
end
