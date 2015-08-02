class Api::MatchesController < ApplicationController
  def index
    @matches = match_repo.all

    render json: @matches, each_serializer: match_serializer
  end

  def show
    @match = match_repo.find(params[:id])

    render json: @match, serializer: match_serializer
  end

  def create
    @match = match_repo.new(match_params)
    @match.occured_at = DateTime.now

    if @match.save
      render json: @match, serializer: match_serializer, status: :created, location: api_match_url(@match)
    else
      render json: @match.errors, status: :unprocessable_entity
    end
  end

  private

  def match_params
    params.require(:match).permit(:winner_id, :loser_id)
  end

  def match_repo
    Persistence::Repos::MatchRepo
  end

  def match_serializer
    MatchSerializer
  end
end
