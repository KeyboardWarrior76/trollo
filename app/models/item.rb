class Item < ApplicationRecord
  belongs_to :list
  belongs_to :user

  def self.get_by_user_and_list(user_id, list_id)
    return Item.find_by_sql(["
      SELECT i.* FROM items AS i
      WHERE i.user_id = ?
      AND i.list_id = ?
    ", user_id, list_id])
  end

  def self.create_item(attr)
    return Item.find_by_sql(["
      INSERT INTO items(item, priority, details, created_at, updated_at, user_id, list_id)
      VALUES (?, ?, ?, ?, ?, ?, ?);
    ", attr[:item], attr[:priority] || "N/A", attr[:details] || "", DateTime.now(), DateTime.now(), attr[:user_id], attr[:list_id]])
  end

end
