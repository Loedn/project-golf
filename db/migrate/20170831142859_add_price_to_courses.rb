class AddPriceToCourses < ActiveRecord::Migration[5.0]
  def change
    add_column :courses, :price, :float
  end
end
