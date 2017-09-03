class AddBalanceToEvents < ActiveRecord::Migration[5.0]
  def change
    add_column :events, :balance, :integer
  end
end
