class CreateLocations < ActiveRecord::Migration
  def change
    #add_index :patients, :location_id
    change_column :patients, :first_name, :string , :limit => 30, null: false
    change_column :patients, :middle_name, :string, :limit => 10
    change_column :patients, :last_name, :string, :limit => 30, null: false
  end
end
