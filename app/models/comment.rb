class Comment < ApplicationRecord
  belongs_to :event
  belongs_to :user
  validates :content, length: { minimum: 1 }
end
