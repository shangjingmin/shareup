class ApplicationController < ActionController::Base
  protect_from_forgery
  
  helper_method :current_user, :logined?

  def logined?
    !!current_user
  end

  def current_user
    @current_user ||= current_user_from_session
  end

  def current_user_from_session
    session[:uid] && User.find(session[:uid])
  end

  #==exception handling
  rescue_from Exception, :with=>:exception_agent
  def exception_agent(exception)
    logger.debug "====>type: #{exception.class}, message: #{exception.message}"
    #TODO HOW TO KNOW THE REQUEST TYPE
    #render :json=>{:status=>"error", :message=>"#{exception.message}"}
    raise
  end
end
