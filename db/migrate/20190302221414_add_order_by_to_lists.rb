class AddOrderByToLists < ActiveRecord::Migration[5.2]
  def change
    add_column :lists, :order_by, :string
  end
end
