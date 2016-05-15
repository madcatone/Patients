class CreatePatients < ActiveRecord::Migration
  def change
    create_table :patients do |t|
      t.string  "first_name", null: false
      t.string  "middle_name"
      t.string  "last_name", null: false
      t.date    "birth_at"
      t.string  "medical_record_no"
      t.string  "gender"
      t.string  "status",null: false
      t.integer "location_id",null: false
      t.integer "view_count"
      t.boolean "deletion", default: false, null: false

      t.timestamps null: false
    end
  end
end
