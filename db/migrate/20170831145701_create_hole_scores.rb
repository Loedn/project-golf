class CreateHoleScores < ActiveRecord::Migration[5.0]
  def change
    create_table :hole_scores do |t|
      t.references :user, foreign_key: true
      t.references :hole, foreign_key: true
      t.references :event, foreign_key: true
      t.integer :strikes

      t.timestamps
    end
  end
end
