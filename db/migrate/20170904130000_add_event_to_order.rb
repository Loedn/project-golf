class AddEventToOrder < ActiveRecord::Migration[5.0]
  def change
    add_reference :orders, :event, foreign_key: true
  end
end
