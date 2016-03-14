class RenameDisciplinesUsersToUsersDisciplines < ActiveRecord::Migration
  def change
    rename_table :disciplines_users, :users_disciplines
  end
end
