class PagesController < ApplicationController
  def home
  end
  def browse
        @bookmark = Bookmark.new
        @profiles = Profile.order(id: :desc).paginate(:page => params[:page], :per_page => 20)

  end
end
