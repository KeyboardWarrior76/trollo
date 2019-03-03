class RemoveOrderFromLists < ActiveRecord::Migration[5.2]
  def change
    remove_column :lists, :order, :string
  end
end
