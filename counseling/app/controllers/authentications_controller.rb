class AuthenticationsController < ApplicationController
  def create
    #render json: user_hash
    @user = User.where(uid: user_hash[:uid], provider: user_hash[:provider]).first
    if @user
      login(@user)
      redirect_to root_path, notice: "You signed in successfully!"
    else
      @user = User.new_from_hash (user_hash)
      if @user.save
        login(@user)
        redirect_to root_path, notice: "You signed up successfully!"
      else
        session[:user_hash] = user_hash
        redirect_to signup_path, alert: "Please complete your registration"
      end
    end
  end

  private 

  def auth_hash
    request.env['omniauth.auth']
  end

  def user_hash
    hash = {}
    hash[:uid] = auth_hash['uid']
    hash[:provider] = auth_hash['provider']
    if auth_hash['info']
      hash[:first_name] = auth_hash['info']['first_name']
      hash[:last_name] = auth_hash['info']['last_name']
      hash[:email] = auth_hash['info']['email']
    end
    if auth_hash['credentials']
      hash[:token] = auth_hash['credentials']['token']
    end
    hash
  end
end
