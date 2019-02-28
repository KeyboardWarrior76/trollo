class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.belongs_to :list, foreign_key: true
      t.belongs_to :user, foreign_key: true
      t.string :item
      t.string :priority
      t.text :details

      t.timestamps
    end
  end
end
