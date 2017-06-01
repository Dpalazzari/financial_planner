class UsersController < ApplicationController

  before_action :set_user, only: [:edit, :update]

  def show
    if session[:user_id].nil?
      render file: "/public/404"
    else
      @user = User.find(session[:user_id])
      @expense = Expense.new
    end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:success] = "Successfully Registered #{@user.name}! This is your budget page."
      redirect_to dashboard_path
    else
      flash[:danger] = "Please make sure all fields are correctly filled out."
      render :new
    end
  end

  def edit
    render file: "/public/404" if session[:user_id] != params[:id].to_i      
  end

  def update
    @user.update(user_params)
    if @user.save
      flash[:success] = "Successfuly changed budget to $#{@user.budget}."
      redirect_to dashboard_path
    else
      flash[:danger] = 'Must submit a new budget.'
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :budget, :password, :password_confirmation)
  end

  def set_user
    @user = User.find(params[:id])
  end

end
