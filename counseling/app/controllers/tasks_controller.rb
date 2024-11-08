class TasksController < ApplicationController
  def new
  end

  def create
    @user = User.where(email: params[:email]).first
    if @user & @user.authenticate(params[:password])
      task[:user_id] = @user.id
      redirect_to root_path, notice: "Logged in successfully"
    else 
      redirect_to login_path, alert: "Invalid login credentials"
    end
  end
end
