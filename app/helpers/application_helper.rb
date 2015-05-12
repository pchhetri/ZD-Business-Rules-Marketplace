module ApplicationHelper
  def signed_in?
    unless session[:username]
      return false # halts the before_action
    else
      return true
    end
  end
end
