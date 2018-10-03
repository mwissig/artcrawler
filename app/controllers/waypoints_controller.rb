class WaypointsController < ApplicationController
  before_action :find_waypoint, only: %i[show edit destroy update]
  before_action :find_event
  before_action :find_user

  def index
    @waypoints = Waypoint.where(event_id: @event.id).paginate(page: params[:page], per_page: 5)
@waypoint = Waypoint.new

        @bookmark = Bookmark.new
  end

  def new
    @waypoint = Waypoint.new
  end

  def update
    if @waypoint.update(waypoint_params)
      flash[:notice] = 'User updated successfully'
      redirect_back(fallback_location: user_event_waypoints_path(@user, @event))
    else
      msg = @waypoint.errors.full_messages
flash.now[:error] = msg
    end
  end

  def create
    @waypoint = Waypoint.new(waypoint_params)
    if logged_in?
@waypoint.user_id = @current_user.id
   end
   @waypoint.event_id = @event.id
     @waypoint.save
    if @waypoint.save
      redirect_back(fallback_location: user_event_waypoints_path(@user, @event))
    else
      render 'new'
      msg = @waypoint.errors.full_messages
flash.now[:error] = msg
    end
  end

  def show
  end

  def edit; end

  def destroy
    @waypoint.destroy
    redirect_back(fallback_location: user_event_waypoints_path(@user, @event))
  end

  private

  def waypoint_params
    params.require(:waypoint).permit(:location_id, :user_id, :event_id)
    end

    def find_waypoint
      @waypoint = Waypoint.find(params[:id])
    end

    def find_event
      @event = Event.find(params[:event_id])
    end

    def find_user
      @user = @event.user
    end
end
