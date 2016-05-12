class AddTranslate < ActiveRecord::Migration
  def change
    create_table :translates do |t|
      t.string :name
      t.text :contact
      t.text :result

      t.timestamps null: false
    end unless table_exists? :translates
  end
end

