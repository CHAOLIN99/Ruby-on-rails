class UsersController < ApplicationController
  before_action :authenticate, except: [:new, :create]
  before_action :load_user, only: [:show, :edit, :update, :destroy]


  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      login(@user)
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
