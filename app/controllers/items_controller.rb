class ItemsController < ApplicationController

    def create
        Item.create_item(
            item: params[:item],
            user_id: current_user.id,
            list_id: params[:id]
        )

        redirect_to( "/boards/#{params[:board_id]}" )
    end

    def update
        Item.update_item(
            user_id: current_user.id,
            item_id: params[:id],
            priority: params[:priority],
            details: params[:details],
        )

        redirect_to( "/boards/#{params[:board_id]}" )
        
    end

    def destroy
        Item.destroy(params[:id])

        redirect_to( "/boards/#{params[:board_id]}" )
    end
end
