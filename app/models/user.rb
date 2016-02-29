class User < ActiveRecord::Base
  has_many :activities, through: :user_activities
  has_many :user_activities

  has_many :rewards, through: :user_rewards
  has_many :user_rewards

  has_secure_password
  enum role: ["default", "admin"]

  def authorize_session
    if admin?
      '/admin/users'
    else
      "/users/#{self.id}"
    end
  end

  def earn_activity_points(activity_id)
    activity_points = Activity.find(activity_id).points
    self.points += activity_points
  end

  def total_points
    activity_points = activities.pluck(:points).inject(:+) || 0
    reward_points = rewards.pluck(:point_cost).inject(:+) || 0
    self.points + activity_points - reward_points
  end

  def claim_reward(reward_id)
    reward_points = Reward.find(reward_id).point_cost
    self.points -= reward_points
  end
end
