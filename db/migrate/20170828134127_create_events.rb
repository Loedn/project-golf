class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.references :course, foreign_key: true
      t.references :user, foreign_key: true
      t.datetime :timeslot

      t.timestamps
    end
  end
end
