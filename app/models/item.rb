class Item < ApplicationRecord
  belongs_to :list
  belongs_to :user


  ##### Probably a SQL injection nightmare #####
  def self.get_by_user_and_list(user_id, list_id, order_by)
    return Item.find_by_sql(["
      SELECT * FROM items AS i
      WHERE user_id = ?
      AND list_id = ?
      ORDER BY #{order_by}
    ", user_id, list_id])
  end

  def self.create_item(attr)
    return Item.find_by_sql(["
      INSERT INTO items(item, priority, details, created_at, updated_at, user_id, list_id)
      VALUES (?, ?, ?, ?, ?, ?, ?);
    ", attr[:item], attr[:priority] || "N/A", attr[:details] || "", DateTime.now(), DateTime.now(), attr[:user_id], attr[:list_id]])
  end

  def self.update_item(attr)
    return List.find_by_sql(["
      UPDATE items 
      SET priority = ?,
          details = ?
      WHERE user_id = ?
      AND id = ?
    ", attr[:priority],  attr[:details], attr[:user_id], attr[:item_id]])
  end

end
