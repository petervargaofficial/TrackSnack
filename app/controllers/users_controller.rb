class UsersController < ApplicationController
  def index
	@users = User.all  	
  end

  def edit
  	@user = User.find_by_id(params[:id])
  end

  def update
  	user = User.find_by_id(params[:id])
  	user.update(user_params)
  	redirect_to users_path
  end

  def new
  	@user = User.new
  end

  def create
  	User.create(user_params)
  	redirect_to(users_path)
  end

  def destroy
  	User.find_by_id(params[:id]).delete
  	redirect_to(users_path)
  end

  private
  def user_params
  	params.require(:user).permit(:name, :email, :role)
  end
  
end
