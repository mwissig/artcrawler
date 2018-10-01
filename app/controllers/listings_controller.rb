class ListingsController < ApplicationController
    before_action :find_listing, only: %i[show edit destroy update]
    before_action :find_location
    before_action :find_event
    before_action :find_user

    def index
      @listings = @location.listings.order(id: :desc).paginate(page: params[:page], per_page: 10)
      @approved_listings = Listing.all.where(approved: true)
      @listing = Listing.new
          @bookmark = Bookmark.new
          @waypoint = Waypoint.new
    end

    def new
      @listing = Listing.new
    end

    def update
      if @listing.update(listing_params)
        flash[:notice] = 'User updated successfully'
        redirect_to user_path(@user)
      else
        render 'edit'
        msg = @listing.errors.full_messages
  flash.now[:error] = msg
      end
    end

    def create
      @listing = @location.listings.new
      @listing.location_id = @location.id
      if logged_in?
  @listing.profile_id = @current_user.profile.id
     end
       @listing.save
      if @listing.save
        redirect_to user_event_location_listings_path(@user, @event, @location)
      else
        render 'new'
        msg = @listing.errors.full_messages
  flash.now[:error] = msg
      end
    end

    def show
    end

    def edit; end

    def destroy
      @listing.destroy
    end

    private

    def listing_params
      params.require(:listing).permit(:location_id, :profile_id)
      end

      def find_listing
        @location = Location.find(params[:id])
      end

      def find_location
        @location = Location.find(params[:location_id])
      end

      def find_event
        @event = Event.find(params[:event_id])
      end

      def find_user
        @user = @event.user
      end
  end
