class Course < ApplicationRecord
  has_many :events, dependent: :destroy
  has_many :reviews, dependent: :destroy
  belongs_to :owner, :class_name => :User , :foreign_key => "owner_id"
  validates :name, presence: true
  has_many :holes
  validates :price, presence: true
  validates :address, presence: true
  # validates :image, presence: true
  validates :description, presence: true
  # validates :email, presence: true
  # validates :phone, presence: true
  # validates :timeslots, presence: true
  mount_uploader :image, PhotoUploader
  geocoded_by :address
  after_validation :geocode, if: :address_changed?
  before_save :capitalize_description
  # after_create :set_timeslots
private

  def capitalize_description
    self.description = self.description.capitalize
  end

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
