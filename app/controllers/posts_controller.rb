class PostsController < ApplicationController
    
  before_filter :save_url, :only => :index  
    
  def index
    filters = Post.generate_conditions(params)
    @posts = Post.paginate(:joins => :info, 
              :conditions => filters[:conditions], :order => filters[:order],
              :page => params[:page], :per_page => RPP_POSTS)
    respond_to do |format|
      format.html
      format.js
    end
  end   
    
  def show
    @post = Post.find(params[:id])
  end
  
  def new
    @post = Post.new
  end
  
  def create
    @post = Post.new(params[:post]) do |post| 
      (current_user.id == params[:user_id].to_i) ? post.user_id = current_user.id : post.user_id = ANONYMOUS_USER_ID
    end
    respond_to do |format|
      if @post.save
        format.html { redirect_to home_path }
      else
        format.html { render :action => "new" }
      end
    end
  end
  
  def destroy
    if admin_logged?
      Post.destroy(params[:id])
      redirect_to session[:home_previous_page]
    end
  end
    
  protected
  
   def save_url
     session[:home_previous_page] = request.url
   end
  
end
