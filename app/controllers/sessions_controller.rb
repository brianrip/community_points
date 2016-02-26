class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    user = User.find_by(username: params[:session][:username])

    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      if user.role == 1
        redirect_to admin_index_path
      else
        redirect_to user_path(user)
      end
    else
      flash[:errors] = "Invalid Login"
      render :new
    end
  end
end





# def create
#   user = User.find_by(username:params[:session][:username])
#   if user && user.authenticate(params[:session][:password])
#     session[:user_id] = user.id
#     redirect_to user_path(user)
#   else
#     flash[:errors] = "Invalid Login"
#     render :new
#   end
# end
#
# def destroy
#   session.clear
#   redirect_to root_path
# end
# end
