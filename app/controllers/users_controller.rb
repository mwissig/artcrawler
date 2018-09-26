class UsersController < ApplicationController
  before_action :find_user, only: %i[show edit index update destroy]
  before_action :new_profile, only: %i[index update show destroy]

  def index

  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to user_path(@user)
    else
      render 'new'
      msg = @user.errors.full_messages
flash.now[:error] = msg
    end
  end

  def show

  end

  def edit; end

  def update
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
    @user.destroy
  end

  private

  def user_params
    params.require(:user).permit(:email, :avatar, :password, :primary_use, :password_confirmation)
  end

  def find_user
    @user = User.find(params[:id])
  end

  def new_profile
    @profile = Profile.new
  end
end
