class UsersController < ApplicationController

  def create
    @user = User.new(params[:user])
    @saved_succesfully = @user.save
    #session[:user_id] = @user.id if @saved_succesfully
    respond_to do |format|
      format.js {render :action => "create"}
    end
  end
  
  def show_posts
    @posts = Post.paginate(:conditions => ["user_id = ?", params[:id]], :order => "created_at DESC", 
              :page => params[:page], :per_page => RPP_POSTS)
    respond_to do |format|
      format.html {render :template => "posts/index"}
      format.js {render :template => "posts/index"}
    end
  end

end
