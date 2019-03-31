class UsersController < ApplicationController
  before_action :require_user_logged_in, only: [:index, :show]
  
  def index
    @users = User.page(params[:page]).per(3)
  end

  def show
    @user = User.find(params[:id])
    @comments = @user.comments
  end

  def new
    @user = User.new
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:success] = 'アカウントが更新されました！'
      redirect_to @user
    else
      flash[:danger] = 'アカウントの更新が失敗しました…'
      render :edit
    end
  end
  
      
  def create
    @user = User.new(user_params)
    
    if @user.save
      flash[:success] = 'ユーザー登録が成功しました！'
      redirect_to @user
      # @user でusers#show に飛ばす
    else
      flash[:danger] = 'ユーザー登録に失敗しました！'
      render :new
      # render :new はただnew.html.erbを表示しているだけ、そのページに移るだけ
    end
    
  end
  
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    
    flash[:success] = "Userの削除に成功しました！"
    redirect_back(fallback_location: root_path)
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :image)
  end
end
