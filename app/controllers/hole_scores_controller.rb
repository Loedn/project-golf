class HoleScoresController < ApplicationController
  skip_after_action :verify_authorized
  skip_after_action :verify_policy_scoped
  def create
    # binding.pry
    @holescore = HoleScore.new(user_id: params[:user_id], event_id: params[:event_id], hole_id: params[:hole_id], strikes: params["hole_score"]["strikes"])
    if @holescore.save
      redirect_to root_path
    else
      redirect_to user_path
    end
  end

  private

  # def holescores_params
  #   params.require()
  # end
  #
end
