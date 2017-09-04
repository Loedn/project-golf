class AddFavouriteCourseToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :favourite_course, :string
  end
end
