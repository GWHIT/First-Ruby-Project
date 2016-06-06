class Admin::UsersController < ApplicationController

  def destroy
   @user = User.find(params[:id])
   @user.destroy
   redirect_to admin_users_path
  end

  def index
    @users = User.all.paginate(page: params[:page], per_page: 20)
  end

  def update
    @user = User.find(params[:id])
    @user.toggle!(:admin)
    redirect_to admin_users_path

   end

  def show
    user = User.find(params[:id])
  end
end
