class UsersController < ApplicationController


  def index
    if params[:query].present?
      @users = User.search_by_interests(params[:query])
    else
      @users = User.search_by_interests(current_user.interests.join(" "))
    end

  end

  def show
    set_user
  end

  def show_map
    # the `geocoded` scope filters only users with coordinates (latitude & longitude)
    @users = User.search_by_interests(current_user.interests.join(" "))
    @markers = @users.geocoded.map do |user|
          {
            lat: user.latitude,
            lng: user.longitude,
            info_window: render_to_string(partial: "info_window", locals: { user: user })
          }

    end


  end



    # <%= cl_image_tag("icons8-avatar-144_cmjsux", width: 200, height: 200, crop: :scale) %>


  private



  def set_user
    @user = User.find(params[:id])
  end
end
