class UsersController < ApplicationController
  # before_filter :require_user
  
  # def index
  #   @users = User.all
  # end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new( params[:user] )
    if @user.save
      UserSession.create( @user )
      flash[:notice] = "Usuario registrado correctamente."
      redirect_to exams_path
    else
      render :action => :new
    end
  end

  def edit
    @user = User.find( params[:id] )
  end
  
  def update
    @user = User.find( params[:id] )
    if @user.update_attributes( params[:user] )
      flash[:notice] = "Account updated!"
      redirect_to users_path
    else
      render :action => :edit
    end
  end
  
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:notice] = "Successfully destroyed User."
    redirect_to users_path
  end
end
