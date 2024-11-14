class UsersController < ApplicationController
  before_action :authenticate, except: [:new, :create]
  before_action :load_user, only: [:show, :edit, :update, :destroy]


  def index
    @users = User.all
  end

  def new
    if session[:user_hash]
      @user = User.new_from_hash(session[:user_hash])
      @user.valid?
    else 
      @user = User.new
    end
  end

  def create
    if session[:user_hash]
      @user = User.new_from_hash(session[:user_hash])
      @user.first_name = user_params[:first_name]
      @user.last_name = user_params[:last_name]
      @user.email = user_params[:email]
    else
      @user = User.new user_params
    end
    @user = User.new(user_params)
    if @user.save
      login(@user)
      session[:user_hash] = nil
      redirect_to root_path, notice: "You signed up sucessfuly!"
    else
      render "new", status: :unprocessable_entity
    end
  end

  def show
    if @user.nil?
      redirect_to users_path, alert: "User not found"
    end
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to @user
    else
      render edit, status: :unprocessable_entity
    end
  end

  def update_password
    @user = current_user
  
    if @user.authenticate(params[:user][:current_password]) && @user.update(user_params.except(:current_password))
      # Manually reset the session
      session[:user_id] = @user.id
      redirect_to root_path, notice: "Password updated successfully"
    else
      flash.now[:alert] = "Current password is incorrect or new password is invalid"
      render :edit
    end
  end
  
  

  def destroy
    logout if current_user == @user
    @user.destroy
    redirect_to root_path, notice: "User deleted"
  end


  private

  def load_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end

  
end
