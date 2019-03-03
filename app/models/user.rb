class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  def full_name
    return "#{self.first_name} #{self.last_name}"
  end

  def get_user(user_id)
    return User.find_by_sql(["
      SELECT * FROM users
      WHERE users.id = ?
    ", user_id])
  end

  def get_users_by_board(board_id)
    return User.find_by_sql(["

        SELECT * FROM users AS u
        INNER JOIN user_boards AS ub 
            ON u.id = ub.board_id
        WHERE ub.board_id = ?

    ", board_id])
  end
end
