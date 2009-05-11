class PostsInfoController < ApplicationController
  def update
    @post = Post.find(params[:post_id])
    @succesfull_vote = @post.info.vote(request.remote_ip)
    @post.user.increment!(:votes) if @succesfull_vote && @post.user.nick != ANONYMOUS_NICK
    respond_to do |format|
      format.js { render :action => "update" }
    end
  end
end
