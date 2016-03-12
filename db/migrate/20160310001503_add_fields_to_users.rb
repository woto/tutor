class AddFieldsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :undergraduate_school, :string
    add_column :users, :graduate_school, :string
    add_column :users, :school_year, :integer
    add_column :users, :teach_fee, :float
    add_column :users, :learn_fee, :float
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :location, :string
    add_column :users, :avatar, :string
    add_column :users, :about, :text
  end
end
