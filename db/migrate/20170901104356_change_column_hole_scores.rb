class ChangeColumnHoleScores < ActiveRecord::Migration[5.0]
  def change
    change_column(:hole_scores, :strikes, :integer, default: 0)
  end
end
