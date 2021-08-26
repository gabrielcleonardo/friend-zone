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

  def show_map
    # the `geocoded` scope filters only users with coordinates (latitude & longitude)
    @users = User.all
    @markers = @users.geocoded.map do |user|
      #unless user.latitude.nil?
        {
          lat: user.latitude,
          lng: user.longitude
        }
      #end

    end

  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end
