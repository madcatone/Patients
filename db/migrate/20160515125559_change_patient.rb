class ChangePatient < ActiveRecord::Migration
  def change
    change_column :patients, :view_count, :integer, default: 0
  end
end
