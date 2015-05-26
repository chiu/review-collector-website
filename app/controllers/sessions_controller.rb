class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])
    

    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to movies_path, notice: "Welcome back, #{user.firstname}!"
    else
      flash.now[:alert] = "Login failed...."
      render :new
    end
  end




end