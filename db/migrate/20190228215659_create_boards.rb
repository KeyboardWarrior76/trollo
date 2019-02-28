class CreateBoards < ActiveRecord::Migration[5.2]
  def change
    create_table :boards do |t|
      t.string :board
      t.boolean :public
      t.string :picture

      t.timestamps
    end
  end
end
