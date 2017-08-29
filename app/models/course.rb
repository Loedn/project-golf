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

  # after_create :set_timeslots

private

  # def set_timeslots
  #   array = []
  #   hour = 9
  #   counter = 0
  #   while hour < 17
  #       array << "#{hour == 9 ? '0' : ''}#{hour}:#{counter < 10 ? '0' : ''}#{counter}"
  #       counter += 5
  #       counter == 60 ? counter = 0 : ''
  #       counter == 0 ? hour += 1 : ''
  #   end
  #
  #   self.update(timeslots: array)
  # end
end
