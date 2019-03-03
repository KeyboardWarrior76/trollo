class BoardsController < ApplicationController
  def index
    @boards = Board.get_user_boards(current_user.id)
  end

  def show
    @board = Board.get_user_board(current_user.id, params[:id].to_i)
    @lists = List.get_lists_by_user_and_board(current_user.id, @board.id)
    puts "====================="
    puts @lists
    puts "====================="
  end

  def new
  end

  def edit
  end
end
