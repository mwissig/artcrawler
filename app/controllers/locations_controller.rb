class LocationsController < ApplicationController
  before_action :find_location, only: %i[show edit destroy update]
  before_action :find_event
  before_action :find_user

  def index
    @locations = @event.locations
    @approved_locations = Location.all.where(approved: true)
    @location = Location.new
  end

  def new
    @location = Location.new
  end

  def update
    if @location.update(location_params)
      flash[:notice] = 'User updated successfully'
      redirect_to user_path(@user)
    else
      render 'edit'
      msg = @location.errors.full_messages
flash.now[:error] = msg
    end
  end

  def create
    @location = @event.locations.new(location_params)
        if logged_in?
    @location.user_id = @current_user.id
       end
       p @user
       p @event
       p @location
     @location.save
    if @location.save
      redirect_to user_event_location_path(@user, @event, @location)
    else
      render 'new'
      msg = @location.errors.full_messages
flash.now[:error] = msg
    end
  end

  def show
  end

  def edit; end

  def destroy
    @location.destroy
  end

  private

  def location_params
    params.require(:location).permit(:name, :description, :address, :suite, :loc_type, :website, :approved)
    end

    def find_location
      @location = Location.find(params[:id])
    end

    def find_event
      @event = Event.find(params[:event_id])
    end

    def find_user
      @user = @event.user
    end
end
