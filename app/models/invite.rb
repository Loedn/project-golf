class Invite < ApplicationRecord
  belongs_to :user
  belongs_to :event
  before_save :destroy_if_no_user

private

  def destroy_if_no_user
    if self.user_id.nil?
      self.destroy
    end
  end
  
end
