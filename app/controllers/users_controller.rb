class UsersController < ApplicationController
  def pick_user
    @users = User.all
  end

  def sign_in
    set_user(user_id)
    redirect_to chat_rooms_path
  end

  private

  def user_id
    params.permit(:id)[:id]
  end
end

