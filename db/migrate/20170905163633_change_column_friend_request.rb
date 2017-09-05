class ChangeColumnFriendRequest < ActiveRecord::Migration[5.0]
  def change
    change_column_default :friend_requests, :status, "pending"
  end
end
