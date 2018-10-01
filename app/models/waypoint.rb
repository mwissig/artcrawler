class Waypoint < ApplicationRecord
  belongs_to :user
  has_one :location
end
