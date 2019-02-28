class AddListToList < ActiveRecord::Migration[5.2]
  def change
    add_column :lists, :list, :string
  end
end
