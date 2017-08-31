class HoleScore < ApplicationRecord
  belongs_to :user
  belongs_to :hole
  belongs_to :event
end
