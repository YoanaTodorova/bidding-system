class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find params[:id]
  end

  private

  def can_comment_on_user? user
    session[:user_id] and session[:user_id] != user[:id]
  end

  helper_method :can_comment_on_user?
end
