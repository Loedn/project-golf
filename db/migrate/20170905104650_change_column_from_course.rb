class ChangeColumnFromCourse < ActiveRecord::Migration[5.0]
  def change
    rename_column :courses, :sand?, :sand
    rename_column :courses, :water?, :water
    rename_column :courses, :trees?, :trees
    rename_column :courses, :plane?, :plane
  end
end
