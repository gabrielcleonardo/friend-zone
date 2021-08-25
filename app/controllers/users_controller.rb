class UsersController < ApplicationController
  def index
    @users = User.all

    # @filter_users = @users.reject do |user|

    #   user.match.status == "denied" || user.match.status == "approved"
    # end

  end

  def show
    set_user
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end
