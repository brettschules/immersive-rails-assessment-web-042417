class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(params[:name])
    if user && user.authenticate(params[:password])
      flash[:sucess] = "Welcome!"
      session[:user_id] = user.id
      redirect_to user_path(user)
    else
      flash[:warning] = "Invalid user/password"
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
  end

end
