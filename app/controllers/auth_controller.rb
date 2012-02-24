class AuthController < ApplicationController
  #get request
  def signuped
    logger.debug "====>params: #{params.inspect}"
    new_user = User.create(params[:user])
    redirect_to root_path
  end

  #post request
  def signin
    #TODO FIXME
    user = User.first
    session[:uid] = user.id
    redirect_to root_path
  end

  #delete request
  def signout
    reset_session
    redirect_to root_path
  end
end
