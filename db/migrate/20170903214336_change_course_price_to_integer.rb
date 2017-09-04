class ChangeCoursePriceToInteger < ActiveRecord::Migration[5.0]
  def change
    change_column :courses, :price, :integer
  end
end
