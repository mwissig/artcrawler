class BookmarksController < ApplicationController
  before_action :find_bookmark, only: %i[show edit update]
  before_action :find_user, only: %i[show index]

  def index
    @bookmarks = Bookmark.all
    @bookmark = Bookmark.new
    @waypoint = Waypoint.new
    @ids = []
    @user.bookmarks.each do |b|
      @ids << b.profile_id
    end

    @lisids = []
   Listing.all.each do |lis|
     @lisids << lis.profile_id
   end

      pr = Profile.find(@ids)
      pr = Profile.where(id: pr.map(&:id))

      @profiles = pr.order(id: :desc).paginate(page: params[:page], per_page: 10)
      @listings = Listing.all.order('listings.location.event.end_date ASC')
      @list = Listing.find_by(profile_id: @lisids)
      @list = Listing.where(profile_id: pr.map(&:id))
  end

  def new
    @bookmark = Bookmark.new
  end

  def update
    if @bookmark.update(bookmark_params)
      flash[:notice] = 'User updated successfully'
      redirect_to user_path(@user)
    else
      render 'edit'
      msg = @bookmark.errors.full_messages
flash.now[:error] = msg
    end
  end

  def create
    if logged_in?
      @bookmark = Bookmark.new(bookmark_params)
      @bookmark.user_id = @current_user.id
      @bookmark.save
      if @bookmark.save
        redirect_back(fallback_location: browse_path)
      else
        redirect_back(fallback_location: browse_path)
        msg = @bookmark.errors.full_messages
flash.now[:error] = msg
      end
  end
end

  def show; end

  def edit; end

  def destroy
    if logged_in?
    @bookmark = Bookmark.find(params[:bookmark_id])
    @bookmark.destroy
            redirect_back(fallback_location: browse_path)
  end
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:profile_id, :user_id)
    end

  def find_bookmark
    @bookmark = Bookmark.find(params[:id])
  end

  def find_user
    @user = User.find(params[:user_id])
  end
end
