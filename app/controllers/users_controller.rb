class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    # If you're using the current_user directly, you might not need to fetch the user from the database again
    @user = current_user
  end
end
