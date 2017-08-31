class CreateHoles < ActiveRecord::Migration[5.0]
  def change
    create_table :holes do |t|
      t.string :name
      t.integer :par
      t.references :course, foreign_key: true

      t.timestamps
    end
  end
end
