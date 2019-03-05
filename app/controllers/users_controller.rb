class UsersController < ApplicationController
  def index
  end

  def show
    @user = User.get_user(params[:id]) if(params[:id].to_i != current_user.id)
  end
end
