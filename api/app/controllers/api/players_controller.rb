class Api::PlayersController < ApplicationController
  def index
    @players = player_repo.all

    render json: @players, each_serializer: player_serializer
  end

  def show
    @player = player_repo.find(params[:id])

    render json: @player, serializer: player_serializer
  end

  def create
    @player = player_repo.new(player_params)

    if @player.save
      render json: @player, serializer: player_serializer, status: :created, location: api_player_url(@player)
    else
      render json: @player.errors, status: :unprocessable_entity
    end
  end

  private

  def player_params
    params.require(:player).permit(:name)
  end

  def player_repo
    Persistence::Repos::PlayerRepo
  end

  def player_serializer
    PlayerSerializer
  end
end
