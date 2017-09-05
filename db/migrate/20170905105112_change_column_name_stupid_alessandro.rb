class ChangeColumnNameStupidAlessandro < ActiveRecord::Migration[5.0]
  def change
    rename_column :courses, :plane, :plain
  end
end
