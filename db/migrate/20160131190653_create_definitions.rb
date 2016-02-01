class CreateDefinitions < ActiveRecord::Migration
  def change
    create_table :definitions do |t|
      t.belongs_to :unit, index: true, foreign_key: true , null: false
      t.text :formula , null: false
      t.belongs_to :converted_to, index: true, foreign_key: true , null: false

      t.timestamps null: false
    end
  end
end
