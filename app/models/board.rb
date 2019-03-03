class Board < ApplicationRecord



    def self.get_user_boards(user_id)
        return Board.find_by_sql(["

            SELECT b.* FROM boards AS b
            INNER JOIN user_boards AS ub 
                ON b.id = ub.board_id
            WHERE ub.user_id = ?

        ", user_id])
    end

    def self.get_user_board(user_id, board_id)
        return Board.find_by_sql(["

            SELECT b.* FROM boards AS b
            INNER JOIN user_boards AS ub 
                ON b.id = ub.board_id
            WHERE ub.user_id = ?
            AND b.id = ?

        ", user_id, board_id]).first()
    end
end
