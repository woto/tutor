class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :title
      t.float :lat
      t.float :lng
      t.integer :location_type
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
