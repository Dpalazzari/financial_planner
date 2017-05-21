class UsersController < ApplicationController

  def show
    if current_user
      render :show
    else
      render file: "/public/404"
    end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:success] = "Successfully Registered, #{@user.name}!"
      redirect_to dashboard_path
    else
      flash[:danger] = "Please make sure all fields are correctly filled out."
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :budget, :password, :password_confirmation)
  end

end
