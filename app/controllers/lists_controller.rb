class ListsController < ApplicationController
    def create
        puts "==============================="
        puts params
        puts "==============================="
        List.create_list(
            list: params[:list],
            order: "Default",
            user_id: current_user.id,
            board_id: params[:board_id].to_i
        )

        redirect_to( "/boards/#{params[:board_id]}" )
    end

    def update
        List.update_list(
            list: params[:list], 
            order_by: params[:order_by],
            user_id: current_user.id,
            list_id: params[:id],
        )

        redirect_to( "/boards/#{params[:board_id]}" )
    end

    def destroy
        List.destroy_list(current_user.id, params[:id])

        redirect_to( "/boards/#{params[:board_id]}" )
    end
end
