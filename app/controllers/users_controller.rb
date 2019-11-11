class UsersController < ApplicationController
  before_action :get_user, only: %i[edit update]
  before_action :authenticate, only: %i[edit update]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to todos_path(@user)
    else
      render 'new'
    end
  end

  def edit; end

  def update
    if @user.update
      redirect_to @user
    else
      render 'edit'
    end
  end

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end

  def get_user
    @user = User.find(params[:id])
  end
end
