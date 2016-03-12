class CreateDisciplinesUsers < ActiveRecord::Migration
  def change
    create_table :disciplines_users do |t|
      t.references :discipline, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
      t.integer :discipline_type
      t.string :discipline_areas
      t.integer :discipline_year
      t.float :dicipline_grade

      t.timestamps null: false
    end
  end
end
