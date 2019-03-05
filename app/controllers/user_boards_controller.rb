class UserBoardsController < ApplicationController

    def create
        existing_boards = UserBoard.get_user_boards(params[:id], params[:board_id])
        
        if(!existing_boards)
          UserBoard.create_user_board(params[:id], params[:board_id])
        end
        redirect_to( "/boards/#{params[:board_id]}")
      end
    
      def destroy
        
      end
end
