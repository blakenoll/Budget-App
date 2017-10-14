class UsersController < ApplicationController

  layout 'user', except: [:new]
  layout 'public'

  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index

  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to login_path
      flash[:notice] = 'Account was succesfully created'
    else
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    if @user.update(user_params)
      redirect_to user_path
      flash[:notice] = 'Info updated succesfully'
    else
      render :edit
    end
  end

  def destroy

  end

  private

  def set_user
    @user = User.find(session[:user_id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :username, :password)
  end

end
