class ProfilesController < ApplicationController
    before_action :find_profile, only: %i[show edit update]
    before_action :find_user, only: %i[show index edit new update create]

    def index
      @profiles = Profile.all
      @profile = Profile.new
    end

    def new
      @profile = Profile.new
    end

    def update
      if @profile.update(profile_params)
        flash[:notice] = 'Profile updated successfully'
        redirect_to user_path(@user)
      else
        render 'edit'
        msg = @profile.errors.full_messages
flash.now[:error] = msg
      end
    end

    def create
      @profile = @user.build_profile(profile_params)
      @profile.save
      if @profile.save
        redirect_to user_path(@user)
      else
        render 'new'
        msg = @profile.errors.full_messages
flash.now[:error] = msg
      end
    end

    def show
    end

    def edit; end

    def destroy
      if logged_in?
        @user = @current_user
      @profile = @current_user.profile
      @profile.destroy
      redirect_to user_path(@user)
    end
    end

    private

    def profile_params
      params.require(:profile).permit(:name, :primary_medium, :secondary_medium, :portfolio, :instagram, :statement, :image)
      end

    def find_profile
      @profile = Profile.find(params[:id])
    end

    def find_user
      @user = User.find(params[:user_id])
    end
  end
