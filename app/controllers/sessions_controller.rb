class SessionsController < ApplicationController
  include SessionsHelper
  
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      redirect_to tasks_path
    else
      flash[:fail] = "ログインに失敗しました"
      render 'new'
    end
  end

  def create_user
    @user = User.new
  end

  def create_user_post
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:success] = "アカウントを作成しました"
      redirect_to tasks_path
    else
      flash[:fail] = "登録に失敗しました"
      render 'create_user'
    end
  end

  def destroy
    #現在のuserがログインしている場合
    log_out if logged_in?
    redirect_to root_url
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
