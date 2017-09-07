class HoleScoresController < ApplicationController
  skip_after_action :verify_authorized
  skip_after_action :verify_policy_scoped
  def create
    @holescore = HoleScore.new(user_id: params[:user_id], event_id: params[:event_id], hole_id: params[:hole_id], strikes: params["hole_score"]["strikes"])
    @holescore.save
    redirect_to :back
  end

  private

  # def holescores_params
  #   params.require()
  # end
  #
end
