module ApplicationHelper
  #check whether is mine resource
  def mine?(user_id = nil)
    session[:uid] && session[:uid] == user_id
  end
end
