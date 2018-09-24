class PagesController < ApplicationController
  def home
  end
  def browse
        @bookmark = Bookmark.new
        @profiles = Profile.all.limit(10)
  end
end
