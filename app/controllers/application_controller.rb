class ApplicationController < ActionController::Base
  attr_accessor :current_user

  def current_user
    @current_user ||=
      begin
        User.find_by(id: session[:user_id])
      end
  end

  def set_user(user_id)
    session[:user_id] = user_id
  end
end
