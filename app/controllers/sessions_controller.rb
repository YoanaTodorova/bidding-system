class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id

      redirect_to users_path, :notice => "success"
    else
      redirect_to :controller => "home", :action => "index", :notice => "fail"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to :controller => "home", :action => "index", :notice => "Logged out!"
  end
end
