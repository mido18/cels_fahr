class CreateUnits < ActiveRecord::Migration
  def change
    create_table :units do |t|
      t.string :name , null: false, unique: true
      t.string :alias, null: false, unique: true

      t.timestamps null: false
    end
  end
end
