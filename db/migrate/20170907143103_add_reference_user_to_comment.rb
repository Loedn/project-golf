class AddReferenceUserToComment < ActiveRecord::Migration[5.0]
  def change
    add_reference :comments, :user, foreign: true, index: true
  end
end
