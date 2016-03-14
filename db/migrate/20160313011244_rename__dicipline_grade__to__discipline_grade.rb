class RenameDiciplineGradeToDisciplineGrade < ActiveRecord::Migration
  def change
    rename_column :users_disciplines, :dicipline_grade, :discipline_grade
  end
end
