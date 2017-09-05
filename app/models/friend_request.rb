class FriendRequest < ApplicationRecord
  belongs_to :user
  belongs_to :friend, foreign_key: :friend_id, class_name: 'User'

  validates :user, presence: true
  validates :friend, presence: true, uniqueness: {scope: :user}

  validate :not_self
  validate :not_pending

  def accept
    Friendship.create(user: self.user, friend: self.friend)
    destroy
  end

  private

  def not_self
    errors.add(:friend, "can't be blank") if user == friend
  end

  def not_pending
    errors.add(:friend, "already requested friendship") if friend.pending_friends.include?(user)
  end
end
