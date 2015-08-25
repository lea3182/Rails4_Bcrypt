class UsersController < ApplicationController

  def index
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    
  end

  def create
    @user = User.create(user_params)
    if @user

    redirect_to user_path(@user)
    else
      @error = "Password does not match"
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

end
