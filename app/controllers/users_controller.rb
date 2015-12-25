class UsersController < ApplicationController
  def new
    if isSignedIn?
      landingPage
    end
  end

  def signup
    @user = User.new(params[:user].permit(:name, :email, :password))
    if (@user.save)
      flash[:success] = "Your account is created, please login!"
      redirect_to login_path
    else
      flash[:error] = "There are some errors, please try again"
      render "new"
    end
  end
end
