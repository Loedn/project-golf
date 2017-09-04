class RemovePriceFromCourses < ActiveRecord::Migration[5.0]
  def change
    remove_column :courses, :price
    add_monetize :courses, :price, currency: { present: false }
  end
end
