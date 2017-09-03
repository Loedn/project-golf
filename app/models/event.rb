class Event < ApplicationRecord
  belongs_to :course
  belongs_to :user
  has_many :invites, dependent: :destroy
  has_many :invited_users, through: :invites, source: :user
  has_many :comments, dependent: :destroy
  validates :timeslot, presence: true
  validates :status, presence: true
end
