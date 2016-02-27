class AdminController < ApplicationController

  def index
    @users = User.where(role: 0)
    @activities = Activity.all
  end

end
