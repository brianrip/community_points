class User < ActiveRecord::Base
  has_many :activities, through: :user_activities
  has_many :user_activities

  has_secure_password
  enum role: ["default", "admin"]

  def authorize_session
    if admin?
      '/admin/users'
    else
      "/users/#{self.id}"
    end
  end
end
