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

    def self.update_board(attr)
        return Board.find_by_sql(["
            UPDATE boards
            SET board = ?,
                public = ?,
                picture = ?
            WHERE id = ?
        ", attr[:board], attr[:public], attr[:picture], attr[:board_id]])
    end

    def self.destroy_board(user_id, board_id)
        lists = List.get_lists_by_board(board_id)

        lists.each() {|list|
            List.destroy_list(user_id, list.id)
        }

        UserBoard.destroy_user_boards(board_id)

        return Board.find_by_sql(["
            DELETE FROM boards
            WHERE id = ?
        ", board_id])
    end
end
