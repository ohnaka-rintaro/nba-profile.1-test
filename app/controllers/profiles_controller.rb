class ProfilesController < ApplicationController
  
  def index
    @profiles = Profile.all
  end
  
  def show
    @profile = Profile.find(params[:id])
  end
  
  def new
    @profile = Profile.new
  end
  
  def create
    @profile = Profile.new(profile_params)
    
    if @profile.save
      flash[:success] = 'Profile がちゃんと送信されました'
      redirect_to profile_path(@profile)
    else
      flash.now[:danger] = 'Profile が送信できませんでした'
      render :new
    end
  end
  
  def edit
    @profile = Profile.find(params[:id])
  end
  
  def update
    @profile = Profile.find(params[:id])
    
    if @profile.update(profile_params)
      flash[:success] = 'Profile はちゃんと編集されました'
      redirect_to profile_path(@profile)
    else
      flash[:danger] = 'Profile を編集できませんでした'
      render :edit
    end
  end
  
  def destroy
    @profile = Profile.find(params[:id])
    @profile.destroy
    
    flash[:success] = 'Profile はちゃんと削除されましたよ！ご安心ください'
    redirect_to profiles_url
  end
  
  private
  
  def profile_params
    params.require(:profile).permit(:name, :content)
  end
end
