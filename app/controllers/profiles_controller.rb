class ProfilesController < ApplicationController
  before_action :set_profile, only: [:show, :edit, :update, :destroy]
  
  def index
    @profiles = Profile.page(params[:page]).per(6)
  end
  
  def show
    #binding.pry
    # set_profileが先に適用される、つまり@profileではidを受け取る
    @comment = Comment.new
    #@comment = @current_user.comment.build
    @comments = @profile.comment
    #これの@profileはset_profileのprofile_idをparamsで受け取って、そのprofile_idに紐づいているcommentを@commentsに代入しているということになる。

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
  
  def search
    @profiles = Profile.search(params[:search])
  end
  
  private
  
  def profile_params
    params.require(:profile).permit(:name, :content, :profile_image)
  end
  
  def set_profile
    @profile = Profile.find(params[:id])
  end
  
end
