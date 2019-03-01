class CommentsController < ApplicationController
  #before_action :require_user_logged_in
  #before_action :correct_user, only: [:destroy]
  
  def index
  end
  
  def show
  end
  
  def create
    #binding.pry
    @comment = Comment.new(comment_params)
    @comment.user = current_user
    #@comment = @current_user.comment.build
    if @comment.save
      redirect_back(fallback_location: root_path)
    else
      redirect_back(fallback_location: root_path)
    end
  end
  
  def destroy
    @comment = Comment.find(params[:profile_id])
    @comment.destroy
    
    flash[:success] = 'コメントは削除されました'
    redirect_back(fallback_location: root_path)
  end
  
  private
  
  def comment_params
    params.require(:comment).permit(:content, :user_id, :profile_id)
  end
end
