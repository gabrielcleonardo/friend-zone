class UsersController < ApplicationController
  def index
    @users = User.all

    # @filter_users = @users.reject do |user|

    #   user.match.status == "denied" || user.match.status == "approved"
    # end

  end
end
