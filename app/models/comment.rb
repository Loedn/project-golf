class Comment < ApplicationRecord
  belongs_to :event
  validates :content, length: { minimum: 1}
end
