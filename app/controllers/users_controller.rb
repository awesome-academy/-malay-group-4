class UsersController < ApplicationController
  def show
    @user = User.find_by id: params[:id]
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      flash[:success] = "Congratulation!! Your registration was successful"
      redirect_to root_url
    else
      flash[:danger] = "Please try again!"
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit :name, :email, :password, :password_confirmation
  end  
end