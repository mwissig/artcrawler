class User < ApplicationRecord
  before_save { self.email = email.downcase }
  validates :password, presence: true,  :on => :create, length: { minimum: 6 }
  validates :password_confirmation, :presence => true, :on => :create
  validates :email, presence: true, length: { maximum: 30 }
  has_secure_password
   has_one_attached :avatar
   has_one :profile, dependent: :destroy
   has_many :bookmarks, dependent: :destroy
   has_many :events, dependent: :destroy
   has_many :waypoints, dependent: :destroy

  def self.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  def authenicated?(attribute, token)
    digest = send("#{attribute}_digest")
    return false if digest.nil?
    BCrypt::Password.new(digest).is_password?(token)
  end
end
