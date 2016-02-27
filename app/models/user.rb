class User < ActiveRecord::Base
  has_secure_password

  enum role: ["default", "admin"]

  def authorize_session
    if admin?
      '/admin'
    else
      "/user/#{current_user.id}"
    end
  end
end
