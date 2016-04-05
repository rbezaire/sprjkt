class AddClickYToSpaces < ActiveRecord::Migration
  def change
    add_column :spaces, :clickY, :string, array: true, default:[]
  end
end
