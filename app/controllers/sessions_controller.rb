class SessionsController < ApplicationController
  def new

  end


  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id

      redirect_to user_path(user.id), :notice => "Logged in!"
    else
       @error = "Incorrect email or password"

      render :new
    end
  end

  def destroy
    session[:user_id] = nil

    redirect_to login_path
  end
end
