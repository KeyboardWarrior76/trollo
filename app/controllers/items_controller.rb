class ItemsController < ApplicationController

    def create
        puts "==============================="
        puts params
        puts "==============================="
        Item.create_item(
            item: params[:item],
            user_id: current_user.id,
            list_id: params[:id]
        )

        redirect_to( "/boards/#{params[:board_id]}" )
    end

    def destroy
        Item.destroy(params[:id])

        redirect_to( "/boards/#{params[:board_id]}" )
    end
end
