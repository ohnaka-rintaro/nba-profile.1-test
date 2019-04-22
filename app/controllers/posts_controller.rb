class PostsController < ApplicationController
  
  def create
    @post = Post.new(post_params)
    @post.user = current_user
    if @post.save!
      redirect_back(fallback_location: root_path)
    else
      redirect_back(fallback_location: root_path)
    end
  end
  
  def post_params
    params.require(:post).permit(:content, :user_id, :topic_id)
  end
  
end
