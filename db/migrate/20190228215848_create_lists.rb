class CreateLists < ActiveRecord::Migration[5.2]
  def change
    create_table :lists do |t|
      t.belongs_to :board, foreign_key: true
      t.belongs_to :user, foreign_key: true
      t.string :order

      t.timestamps
    end
  end
end
