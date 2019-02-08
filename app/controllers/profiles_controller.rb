class ProfilesController < ApplicationController
  before_action :set_profile, only: [:show, :edit, :update, :destroy]
  
  def index
    @profiles = Profile.all
  end
  
  def show
    @comments = @profile.comment
    #これの@profileはset_profileのprofile_idをparamsで受け取って、そのprofile_idに紐づいているcommentを@commentsに代入しているということになる。
    @comment = Comment.new
    #@comment = @current_user.comment.build
  end
  
  def new
    @profile = Profile.new
  end
  
  def create
    @profile = Profile.new(profile_params)
    @profile.user_id = current_user.id
    
    if @profile.save
      flash[:success] = 'Profile がちゃんと送信されました'
      redirect_to profile_path(@profile)
    else
      flash.now[:danger] = 'Profile が送信できませんでした'
      render :new
    end
  end
  
  def edit
  end
  
  def update
    
    if @profile.update(profile_params)
      flash[:success] = 'Profile はちゃんと編集されました'
      redirect_to profile_path(@profile)
    else
      flash[:danger] = 'Profile を編集できませんでした'
      render :edit
    end
  end
  
  def destroy
    @profile.destroy
    
    flash[:success] = 'Profile はちゃんと削除されましたよ！ご安心ください'
    redirect_to profiles_url
  end
  
  private
  
  def profile_params
    params.require(:profile).permit(:name, :content)
  end
  
  def set_profile
    @profile = Profile.find(params[:id])
  end
end
