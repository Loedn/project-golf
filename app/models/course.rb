class Course < ApplicationRecord
  # belongs_to :owner
  has_many :events, dependent: :destroy
  validates :name, presence: true
  # validates :address, presence: true
  # validates :image, presence: true
  # validates :description, presence: true
  # validates :email, presence: true
  # validates :phone, presence: true
  # validates :timeslots, presence: true
  mount_uploader :photo, PhotoUploader
end
