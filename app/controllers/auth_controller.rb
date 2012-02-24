class AuthController < ApplicationController
  def signuped
    if _signin(User.create!(params[:user]))
      redirect_to root_path
    else
      render :action=>:signup
    end
  end

  def signined
    _signin(User.authenticate(params[:auth])) 
    redirect_to root_path
  end

  def signout
    reset_session
    redirect_to root_path
  end

  def _signin(user)
    return if user.nil?
    session[:uid] = user.id
    user.id
  end
end
