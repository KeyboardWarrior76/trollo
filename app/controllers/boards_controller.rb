class BoardsController < ApplicationController
  before_action :get_boards, only: [:index, :new, :edit]
  before_action :get_board, only: [:show]

  def index
  end

  def show
    # @board = Board.get_user_board(current_user.id, params[:id])
    @lists = List.get_lists_by_user_and_board(current_user.id, @board.id)
    @board_users = User.get_users_by_board(@board.id)
    @all_users = User.get_all_users()
  end

  def new
  end

  def edit
    @board_edit = Board.get_user_board(current_user.id, params[:id])
  end

  def create
    board = Board.create(
      board: params[:board],
      public: params[:public] == "true"? true : false,
      picture: params[:picture],
    )

    UserBoard.create_user_board(current_user.id, board.id)

    redirect_to("/boards")
  end

  def update
    Board.update_board(
      board: params[:board],
      public: params[:public] == "true"? true : false,
      picture: params[:picture],
      board_id: params[:id].to_i,
    )
      redirect_to("/boards")
  end

  def destroy
    Board.destroy_board(current_user.id, params[:id].to_i)
    redirect_to("/boards")
  end

  private
    def get_boards
      return @boards = Board.get_user_boards(current_user.id)
    end

    def get_board
      @board = Board.get_user_board(current_user.id, params[:id].to_i)
    end

end
