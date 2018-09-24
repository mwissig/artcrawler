class Bookmark < ApplicationRecord
    before_save { self.user_id = user_id.to_i }
    before_save { self.profile_id = profile_id.to_i }
  belongs_to :user
end
