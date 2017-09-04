class ChangeEventBalanceToMoney < ActiveRecord::Migration[5.0]
  def change
    remove_column :events, :balance
    add_monetize :events, :balance, currency: { present: false }
  end
end
