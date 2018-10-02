class UsersController < ApplicationController
  before_action :find_user, only: %i[show edit index update]
  before_action :new_profile, only: %i[index update show destroy]
 before_action :skip_password_attribute, only: :update

  def index

  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to login_path
    else
      render 'new'
      msg = @user.errors.full_messages
flash.now[:error] = msg
    end
  end

  def show
    @bookmark = Bookmark.new
  end

  def edit; end

  def update
    @user.save!
    if @user.update(user_params)
      flash[:notice] = 'User updated successfully'
      redirect_to @user
    else
      render 'edit'
      msg = @user.errors.full_messages
flash.now[:error] = msg
    end
  end

  def destroy
    if logged_in?
    @user = @current_user
    @user.destroy
    session[:user_id] = nil
    redirect_to root_path
  end
  end

  private

  def user_params
    params.require(:user).permit(:email, :avatar, :city, :state, :password, :password_confirmation, :primary_use)
  end

  def find_user
    @user = User.find(params[:id])
  end

  def new_profile
    @profile = Profile.new
  end

  def skip_password_attribute
  if params[:password].blank? && params[:password_validation].blank?
    params.except(:password, :password_validation)
  end
end
end
