class AddReferenceUserToReview < ActiveRecord::Migration[5.0]
  def change
    add_reference :reviews, :user, foreign: true, index: true
  end
end
