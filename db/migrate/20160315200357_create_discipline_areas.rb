class CreateDisciplineAreas < ActiveRecord::Migration[5.0]
  def change
    create_table :discipline_areas do |t|
      t.references :discipline, foreign_key: true
      t.string :title

      t.timestamps
    end
  end
end
