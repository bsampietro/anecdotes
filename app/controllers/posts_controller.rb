class PostsController < ApplicationController
    
  before_filter :save_url, :only => :show_by_filter  
    
  def index
    redirect_to home_path
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
        @post.create_info
        @post.tag.increment!(:number_of_stories)
        format.html { redirect_to home_path }
      else
        format.html { render :action => "new" }
      end
    end
  end
  
  def destroy
    if admin_logged?
      Post.delete(params[:id])
      redirect_to :back
    end
  end
  
  def show_by_filter
    filters = Post.generate_conditions(params)
    @posts = Post.paginate(:joins => :info, 
              :conditions => filters[:conditions], :order => filters[:order],
              :page => params[:page], :per_page => RPP_POSTS)
    respond_to do |format|
      format.html
      format.js
    end
  end
  
  def show_by_user
    @posts = Post.paginate(:conditions => ["user_id = ?", params[:id]], :order => "created_at DESC", 
              :page => params[:page], :per_page => RPP_POSTS)
    respond_to do |format|
      format.html {render :action => "show_by_filter"}
      format.js {render :action => "show_by_filter"}
    end
  end
  
  def show_by_title    
    filters = Post.generate_conditions(params)
    @posts = Post.paginate(:conditions => filters[:conditions], :order => "created_at DESC", 
              :page => params[:page], :per_page => RPP_POSTS)
    respond_to do |format|
      format.html {render :action => "show_by_filter"}
      format.js {render :action => "show_by_filter"}
    end
  end
  
  protected
  
   def save_url
     session[:home_previous_page] = request.url
   end
  
end
