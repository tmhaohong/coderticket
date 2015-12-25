class SessionController < ApplicationController
  def new
    if isSignedIn?
      landingPage
    end
  end

  def create
    @user = User.find_by_email(params[:user]["email"])
    if(@user && @user.authenticate(params[:user]["password"]))
      flash[:success] = "Welcome back, #{params[:user][:name]}"
      session[:user_id] = @user.id
      landingPage
    else
      flash[:error] = "Incorrect username or password, please try again"
      session[:user_id] = nil
      redirect_to login_path
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to login_path
  end
end
