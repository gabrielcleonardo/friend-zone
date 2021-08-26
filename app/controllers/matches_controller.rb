class MatchesController < ApplicationController
  def index

    @matches = Match.search_by_matches(current_user.id)

  end

  def create
    @user_id_1 = current_user.id
    @user_id_2 = User.find(params[:data]).id
    @match = Match.new(user_1_id: @user_id_1, user_2_id: @user_id_2)
    @match.save
    redirect_to my_matches_path, notice: 'Congratulation, now wait for your match.'
  end

  def update
    @match = Match.find(param[:id])
    @match.update(status = true)
  end

  def destroy

  end
end
