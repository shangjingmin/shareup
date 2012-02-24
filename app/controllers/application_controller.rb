class ApplicationController < ActionController::Base
  protect_from_forgery
  
  helper_method :current_user, :logined?

  def logined?
    !!current_user
  end

  def current_user
    @current_user ||= get_from_session
  end

  def get_from_session
    session[:uid] && User.find(session[:uid])
  end
end
