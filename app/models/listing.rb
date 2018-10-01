class Listing < ApplicationRecord
  belongs_to :location
  scope :ordered, -> {
    joins(:locations => :events).order("events.start_date ASC")
  }
end
