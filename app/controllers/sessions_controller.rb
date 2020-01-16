class SessionsController < ApplicationController
  def create
  	user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_url
    else
      flash.now[:alert] = "Email or password Is Invalid"
      render "_login"
    end
  end

  def destroy
  	session[:user_id] = nil
    redirect_to root_url, notice: "Logged Out!"
  end
end
