class UsersController < ApplicationController
before_action: :logged_in, only: [:new :create]
  def index
  end

  def show
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params(:username, :password))

    if @user.save
      flash[:sucess] = "Welcome!"
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      flash[:error] = "Go Away"
      redirect_to root_path
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

private

  def user_params(*args)
    params.require(:user).permit(@args)
  end

end
