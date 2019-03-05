class UserBoard < ApplicationRecord
  belongs_to :user
  belongs_to :board

  def self.get_user_boards(user_id, board_id)
    return UserBoard.find_by_sql(["
      SELECT * FROM user_boards
      WHERE user_id = ?
      AND board_id = ?
    ", user_id, board_id]).first()
  end

  def self.create_user_board(user_id, board_id)
    return UserBoard.find_by_sql(["
      INSERT INTO user_boards(user_id, board_id, created_at, updated_at)
      VALUES (?, ?, ?, ?)
    ", user_id, board_id, DateTime.now(), DateTime.now()])
  end

  def self.destroy_user_board(user_id, board_id)
    return UserBoard.find_by_sql(["
      DELETE FROM user_boards
      WHERE user_id = ?
      AND board_id = ?  
    ", user_id, board_id])
  end
end
