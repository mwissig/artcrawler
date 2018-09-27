class EventsController < ApplicationController
  before_action :find_event, only: %i[show edit destroy update]
  before_action :find_user, only: %i[show index edit update]

  def index
    @events = Event.all
    @upcoming_events = Event.all.where("end_date > ?", Time.now.to_date - 7).order(start_date: :asc).paginate(page: params[:page], per_page: 20)
    @event = Event.new
  end

  def new
    @event = Event.new
    if logged_in?
    @user = @current_user
  end
  end

  def update
    if @event.update(event_params)
      flash[:notice] = 'User updated successfully'
      redirect_to user_path(@user)
    else
      render 'edit'
      msg = @event.errors.full_messages
flash.now[:error] = msg
    end
  end

  def create
    if logged_in?
    @user = @current_user
  end
    @event = Event.new(event_params)
    @event.user_id = @current_user.id
    @event.save
    if @event.save
      redirect_to user_event_path(@user, @event)
    else
      render 'new'
      msg = @event.errors.full_messages
flash.now[:error] = msg
    end
  end

  def show
  end

  def edit; end

  def destroy
    @event.destroy
  end

  private

  def event_params
    params.require(:event).permit(:title, :start_date, :end_date, :neighborhood, :city, :state, :description, :website, :private)
    end

  def find_event
    @event = Event.find(params[:id])
  end

  def find_user
    @user = @event.user
  end
end
