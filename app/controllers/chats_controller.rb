class ChatsController < ApplicationController
  def show
    @messages= Chat.find(params[:id])
  end

  def create
  end
end
