class CreateLayers < ActiveRecord::Migration
  def change
    create_table :layers do |t|
      t.string :aryx
      t.string :aryy
      t.string :arydrag
      t.binary :zval
	  t.references :user, index:true, foreign_key: true

      t.timestamps null: false
    end
  end
end
