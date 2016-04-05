class AddClickDragToSpaces < ActiveRecord::Migration
  def change
    add_column :spaces, :clickDrag, :string, array: true, default: []
  end
end
