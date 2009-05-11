class SessionsController < ApplicationController

  before_filter :check_admin_login
  
  def create
    @user = User.authenticate(params[:nick], params[:password])         
    session[:user_id] = @user.id if @user
  end
  
  def destroy
    reset_session
  end
  
  protected
  
  def check_admin_login
    session[:is_admin] = true if params[:nick] == ADMIN_USER && params[:password] == ADMIN_PASSWORD
  end

end
