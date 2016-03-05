class CreateSpaces < ActiveRecord::Migration
  def change
    create_table :spaces do |t|
      t.references :user, index: true, foreign_key: true
      t.string :spacename

      t.timestamps null: false
    end
  end
end
