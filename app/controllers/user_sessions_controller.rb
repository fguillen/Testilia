class UserSessionsController < ApplicationController

  
  def new
    @user_session = UserSession.new
  end
  
  def create
    @user_session = UserSession.new(params[:user_session])
    if @user_session.save
      flash[:notice] = "Login successful!"
      redirect_to users_path
    else
      render :action => :new
    end
  end
  
  def destroy
    current_user_session.destroy  if current_user_session
    flash[:notice] = "Logout successful!"
    redirect_to new_user_session_url
  end
end
