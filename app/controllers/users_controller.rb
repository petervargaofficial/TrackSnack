class UsersController < ApplicationController
  # before_filter :signed_in_user

  def index
    @users = User.all
  end

  def edit
    @user = User.find_by_id(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update_attributes(user_params)
    redirect_to @user
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      # Spencer: "Welcome to the TrackSnack app!!!!"
      flash[:success] = "Welcome to the Cook Book app!"
      sign_in @user
      redirect_to @user
    else
      flash[:error] = "Failed to create account.  Try again."
      redirect_to new_user_path
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def destroy
    User.find_by_id(params[:id]).delete
    redirect_to(users_path)
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

end
