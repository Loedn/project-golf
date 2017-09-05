class AddBadgesToCourses < ActiveRecord::Migration[5.0]
  def change
    add_column :courses, :size, :string
    add_column :courses, :water?, :boolean
    add_column :courses, :sand?, :boolean
    add_column :courses, :trees?, :boolean
    add_column :courses, :plane?, :boolean
  end
end
