class UsersController < ApplicationController
  skip_before_action :require_login, only: [:new, :create, :index]

  def index
  end

  def create
    @user = User.new(reg_helper)
    if @user.save
      session[:user_id] = @user.id
      redirect_to ideas_path
    else
      flash[:errors] = @user.errors.full_messages
      redirect_to '/'
    end
  end

  def show
    @user = User.find(params[:id])
  end

  private
  def reg_helper
    params.require(:user).permit(:first_name, :last_name, :email, :password) if params[:user].present?
  end
end
