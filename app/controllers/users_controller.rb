class UsersController < ApplicationController
  before_action :correct_user, only: [:edit, :update]
  before_action :set_user, only: %i[ create show edit update comments ]

 def index
   @users = User.all
 end
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to new_session_path
    else
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def update
   @user = User.find(params[:id])
   if @user.update(user_params)
     redirect_to user_path(@user.id)
   else
     render :edit
   end
 end

private

 def user_params
   params.require(:user).permit(:name, :email, :password, :password_confirmation, :phone )
 end

 def correct_user
   user = User.find(params[:id])
   if current_user != user
     redirect_to foods_path
   end
 end

 def set_user
   @user = User.find(params[:id])
 end
end