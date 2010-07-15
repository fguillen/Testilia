class UserSessionsController < ApplicationController

  
  def new
    @user_session = UserSession.new
  end
  
  def create
    @user_session = UserSession.new(params[:user_session])
    if @user_session.save
      flash[:notice] = "Usuario aceptado."
      redirect_to exams_path
    else
      render :action => :new
    end
  end
  
  def destroy
    current_user_session.destroy  if current_user_session
    flash[:notice] = "Sesión cerrada."
    redirect_to new_user_session_url
  end
end
