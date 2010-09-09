class UserSessionsController < ApplicationController
  def new
    @user_session = UserSession.new
  end

  def create
    if UserSession.create(params[:user_session])
      return if redirect_to '/', :notice => "Welcome"
    end
    redirect_to '/user_sessions/new'
  end

  def destroy
    current_user_session.destroy
    redirect_to '/login'
  end

end
