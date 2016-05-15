class CreateLocation2 < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string "code", limit: 10
      t.string "name", limit: 80, null: false

      t.timestamps null: false
    end unless table_exists? :locations
  end
end
