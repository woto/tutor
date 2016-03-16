class ConvertDisciplineAreasFromStringToArray < ActiveRecord::Migration[5.0]
  def change
    change_column :users_disciplines, :discipline_areas, "INTEGER[] USING (string_to_array(discipline_areas, ','))"
  end
end
