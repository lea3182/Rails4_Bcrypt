class UsersController < ApplicationController

  def index
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    if @user.save
    # flash[:notice] = "Sign Up Successful"
    redirect_to user_path(@user), :notice => "Sign Up Successful"
    else
    ender :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

end
