class UsersController < ApplicationController
  def index
  end

  def show
    if(params[:id].to_i != current_user.id)
      @user = User.get_user(params[:id])
      @boards = Board
                .get_user_boards(params[:id])
                .select() {|item|
                  item.public == true
                }
    end
  end
end
