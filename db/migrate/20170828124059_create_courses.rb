class CreateCourses < ActiveRecord::Migration[5.0]
  def change
    create_table :courses do |t|
      t.string :description
      t.string :name
      t.string :image
      t.string :address
      t.float :latitude
      t.float :longitude
      t.string :email
      t.string :phone
      t.datetime :timeslots, array: true, default: []
      t.string :badges, array: true, default: []
      t.references :owner, foreign_key: {to_table: :users}, index: true

      t.timestamps
    end
  end
end
