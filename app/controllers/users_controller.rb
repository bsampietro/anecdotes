class UsersController < ApplicationController

  def create
    @user = User.new(params[:user])
    @saved_succesfully = @user.save
    #session[:user_id] = @user.id if @saved_succesfully
    respond_to do |format|
      format.js {render :action => "create"}
    end
  end

end
