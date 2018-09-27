class Event < ApplicationRecord
    belongs_to :user
    has_many :locations
    has_one_attached :image
     accepts_nested_attributes_for :locations, :allow_destroy => true
end
