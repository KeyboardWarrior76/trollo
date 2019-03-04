class UserBoardsController < ApplicationController

    def create
        UserBoard.create_user_board(params[:id], params[:board_id])
        redirect_to( "/boards/#{params[:board_id]}" )
      end
    
      def destroy
        
      end
end
