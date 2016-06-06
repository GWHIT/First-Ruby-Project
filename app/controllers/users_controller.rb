class UsersController < ApplicationController



  def destroy
   @user = Comment.find(params[:id])
   @user.destroy
   redirect_to admin_users_path
  end  

  def index
    @users = User.all.paginate(page: params[:page], per_page: 5)
  end

  def update
    user = User.find(params[:id])
    user.toggle!(:admin)
    redirect_to admin_users_path
  end
end
