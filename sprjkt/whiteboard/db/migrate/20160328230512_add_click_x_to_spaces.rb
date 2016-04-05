class AddClickXToSpaces < ActiveRecord::Migration
  def change
    add_column :spaces, :clickX, :string, array: true, default:[]
  end
end
