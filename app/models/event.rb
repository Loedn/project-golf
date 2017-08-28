class Event < ApplicationRecord
  belongs_to :course
  belongs_to :user
  has_many :invites, dependent: :destroy
  has_many :invited_users, through: :invites, source: :user
  # validates :timeslot, presence: true
end
