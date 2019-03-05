class List < ApplicationRecord
  belongs_to :board
  belongs_to :user


  def self.get_lists_by_board(board_id)
    return List.find_by_sql(["
      SELECT l.* FROM lists AS l
      WHERE l.board_id = ?
      ORDER BY l.created_at
    ", board_id])
  end

  def self.create_list(attr)
    return List.find_by_sql(["
      INSERT INTO lists(order_by, list, created_at, updated_at, user_id, board_id)
      VALUES (?, ?, ?, ?, ?, ?);
    ",  attr[:order_by] || "priority, created_at", attr[:list], DateTime.now(), DateTime.now(), attr[:user_id], attr[:board_id]])
  end

  def self.destroy_list(user_id, list_id)
    List.find_by_sql(["
      DELETE FROM items
      WHERE list_id = ?  
    ", list_id])

    return List.find_by_sql(["
      DELETE FROM lists
      WHERE user_id = ?
      AND id = ?
    ", user_id, list_id])
  end


  def self.update_list(attr)
    return List.find_by_sql(["
      UPDATE lists 
      SET list = ?,
          order_by = ?
      WHERE user_id = ?
      AND id = ?
    ", attr[:list], attr[:order_by], attr[:user_id], attr[:list_id]])
  end
end
