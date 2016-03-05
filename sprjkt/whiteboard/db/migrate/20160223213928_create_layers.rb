class CreateLayers < ActiveRecord::Migration
  def change
    create_table :layers do |t|
      t.references :user, index: true, foreign_key: true
      t.binary :drawdata
      t.integer :z_val

      t.timestamps null: false
    end
  end
end
