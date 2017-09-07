class HoleScoresController < ApplicationController
  skip_after_action :verify_authorized
  skip_after_action :verify_policy_scoped
  def create
    @hole_score = HoleScore.new(hole_score_params)
    if @hole_score.save
    respond_to do |format|
      format.js
      format.html { redirect_to :back }
    end
  end
end

  private

  def hole_score_params
    params.require(:hole_score).permit(:user_id, :hole_id, :strikes)
  end
end
