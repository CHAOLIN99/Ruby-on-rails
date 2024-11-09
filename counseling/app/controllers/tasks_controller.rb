class TasksController < ApplicationController
  def new
      @user = User.new  # This helps with form building
  end
  
  def create
    @user = User.where(email: params[:email]).first
    if @user && @user.authenticate(params[:password])
      login(@user)
      redirect_url = session[:protected_page] || root_path
      session[:protected_page] = nil
      redirect_to redirect_url, notice: "Logged in successfully"
    else
      redirect_to login_path, alert: "Invalid email or password"
    end
  end

  def destroy
    logout
    redirect_to root_path, notice: "Logged out successfully"
  end
end
