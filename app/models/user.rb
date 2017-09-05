class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  # this for events thing
  has_many :invites
  has_many :events
  has_many :comments
  has_many :invited_events , through: :invites, source: :events
  has_many :courses
  has_many :hole_scores
  has_many :reviews
  has_many :notifications

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
  # validates :gender, presence: true

  # friendship
  has_many :friendships, dependent: :destroy
  has_many :friends, through: :friendships, foreign_key: :friend_id
  # requests that the user received
  has_many :friend_requests, foreign_key: :friend_id, dependent: :destroy
  # requests that the user sent
  has_many :pending_friend_requests, class_name: 'FriendRequest', dependent: :destroy, foreign_key: :user_id
  # friends who haven't accepted the user request yet
  has_many :pending_friends, through: :pending_friend_requests, source: :friend


# search stuff
include PgSearch
  pg_search_scope :search_by_fullname, against: [ :first_name, :last_name]

  #API TOKEN:
  acts_as_token_authenticatable
  # this for uploading profile pic
  mount_uploader :photo, PhotoUploader

  # this for fb login
  devise :omniauthable, omniauth_providers: [:facebook]
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


  def name
    "#{first_name} #{last_name}"
  end

  def self.find_for_facebook_oauth(auth)
    user_params = auth.slice(:provider, :uid)
    user_params.merge! auth.info.slice(:email, :first_name, :last_name)
    user_params[:facebook_picture_url] = auth.info.image
    user_params[:token] = auth.credentials.token
    user_params[:token_expiry] = Time.at(auth.credentials.expires_at)
    user_params = user_params.to_h

    user = User.find_by(provider: auth.provider, uid: auth.uid)
    user ||= User.find_by(email: auth.info.email) # User did a regular sign up in the past.
    if user
      user.update(user_params)
    else
      user = User.new(user_params)
      user.password = Devise.friendly_token[0,20]  # Fake password for validation
      user.save
    end

    return user
  end
end
