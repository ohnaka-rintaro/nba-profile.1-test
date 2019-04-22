class TopicsController < ApplicationController
  def index
    @topics = Topic.all
  end
  
  def show
    @topics = Topic.find(params[:id])
    @post = Post.new
  end
  
  def new
    @topic = Topic.new
  end
  
  def create
    @topic = Topic.new(topic_params)
    
    if @topic.save
      flash[:success] = "トピックが作成されました。"
      redirect_to topic_path(@topic)
    else
      flash.now[:danger] = "トピックが作成されませんでした。"
      render :new
    end
  end
  
  private
  
  def topic_params
    params.require(:topic).permit(:title)
  end
end
