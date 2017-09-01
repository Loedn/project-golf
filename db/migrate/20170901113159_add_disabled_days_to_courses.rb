class AddDisabledDaysToCourses < ActiveRecord::Migration[5.0]
  def change
    add_column :courses, :disabled_days, :integer, array: true, default: []
  end
end
