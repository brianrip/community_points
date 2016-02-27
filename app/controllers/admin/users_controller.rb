class Admin::UsersController < Admin::BaseController
  def index
    @users = User.where(role: 0)
    @activities = Activity.all
  end

  def destroy
    @user = User.find(params[:id])
    @user.delete
    redirect_to admin_users_path
  end

  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to admin_users_path
    else
      flash.now[:error] = "Invalid Entry"
      render :edit
    end
  end



  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to admin_users_path
    else
      flash.now[:error] = "Invalid Entry"
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end


end
