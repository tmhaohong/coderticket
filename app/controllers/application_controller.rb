class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :get_current_user, :isSignedIn?, :require_login
  def require_login
    redirect_to login_path unless isSignedIn?
  end

  def get_current_user
    if session[:user_id]
      User.find(session[:user_id])
    else
      nil
    end
  end

  def isSignedIn?
    if get_current_user
      true
    end
  end

  def landingPage
    redirect_to controller:"events", action: "index"
  end
end
