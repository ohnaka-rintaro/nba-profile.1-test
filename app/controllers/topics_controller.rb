class TopicsController < ApplicationController
  def index
    @topics = Topic.all
  end
  
  def show
    @topic = Topic.find(params[:id])
    @post = Post.new
    @posts = @topic.posts
    # @posts = @topics.post.order('created_at DESC')
    #@onlyuser = @posts.user_id == current_user.id
    #@onlyuser.content
  end
  
  def new
    @topic = Topic.new
  end
  
  def create
    @topic = Topic.new(topic_params)
    @topic.user_id = current_user.id
    
    if @topic.save
      flash[:success] = "トピックが作成されました。"
      redirect_to topic_path(@topic)
    else
      flash.now[:danger] = "トピックが作成されませんでした。"
      render :new
    end
  end
  
  def destroy
    @topic = Topic.find(params[:id])
    @topic.destroy
    
    flash[:success] = "トピックが削除されました。"
    redirect_to topics_url
  end
  
  private
  
  def topic_params
    params.require(:topic).permit(:title)
  end
end
