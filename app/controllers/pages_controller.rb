class PagesController < ApplicationController
  def home; end

  def browse
    @bookmark = Bookmark.new
    @profiles = Profile.order(id: :asc).paginate(page: params[:page], per_page: 20)
  end

  def events
    @events = Event.all.where('end_date > ?', Time.now.to_date - 7).order(start_date: :asc).paginate(page: params[:page], per_page: 20)
    if logged_in?
      if @events.where(city: @current_user.city) != nil
        @events = Event.all.where('end_date > ? AND city = ?', Time.now.to_date - 7, @current_user.city).order(start_date: :asc).paginate(page: params[:page], per_page: 20)
        @title = 'Events in ' + @current_user.city + ', ' + @current_user.state + ''
      elsif @events.where(city: @current_user.city) != nil
        @events = Event.all.where('end_date > ? AND state = ?', Time.now.to_date - 7, @current_user.state).order(start_date: :asc).paginate(page: params[:page], per_page: 20)
        @title = 'Events in ' + @current_user.state + ''
      else
        @title = 'All Events'
        @events = Event.all.where('end_date > ?', Time.now.to_date - 7).order(start_date: :asc).paginate(page: params[:page], per_page: 20)
    end
    else
      @title = 'All Events'
      @events = Event.all.where('end_date > ?', Time.now.to_date - 7).order(start_date: :asc).paginate(page: params[:page], per_page: 20)
                end
  end

  def events_by_state
    if logged_in?
      @events = Event.all.where('end_date > ? AND state = ?', Time.now.to_date - 7, @current_user.state).order(start_date: :asc).paginate(page: params[:page], per_page: 20)
  end
  end

  def events_by_city
    if logged_in?
      @events = Event.all.where('end_date > ? AND city = ?', Time.now.to_date - 7, @current_user.city).order(start_date: :asc).paginate(page: params[:page], per_page: 20)
  end
  end

  def events_all
    if logged_in?
      @events = Event.all.where('end_date > ?', Time.now.to_date - 7).order(start_date: :asc).paginate(page: params[:page], per_page: 20)
  end
    end

  def artists
    @listings = []
    @event = Event.find(params[:event_id])
    @user = @event.user

    @event.locations.each do |loc|
      @listings << loc.listings
    end
    @listings = @listings.paginate(page: params[:page], per_page: 20)
    @bookmark = Bookmark.new
  end

  def mymaps
    if logged_in?
      @eventids = []
      @events = []
      @mywaypoints = Waypoint.all.where(user_id: @current_user.id)
      @mywaypoints.each do |w|
        @event = Event.all.where(id: w.event_id)
        @eventids << @event.ids
      end
      @eventids.uniq!
      @eventids.flatten!
      @eventids.each do |i|
        @events << Event.find_by(id: i)
      end
      @events = @events.paginate(page: params[:page], per_page: 15)
    end
  end

end
