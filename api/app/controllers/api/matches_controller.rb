class Api::MatchesController < ApplicationController
  def index
    @matches = Match.all

    render json: @matches
  end

  def show
    @match = Match.find(params[:id])

    render json: @match
  end

  def create
    @match = Match.new(match_params)
    @match.occured_at = DateTime.now

    if @match.save
      render json: @match, status: :created, location: api_match_url(@match)
    else
      render json: @match.errors, status: :unprocessable_entity
    end
  end

  private

  def match_params
    params.require(:match).permit(:winner_id, :loser_id)
  end
end
