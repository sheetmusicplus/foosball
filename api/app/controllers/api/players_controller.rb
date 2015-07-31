class Api::PlayersController < ApplicationController
  def index
    @players = Player.all

    render json: @players
  end

  def show
    @player = Player.find(params[:id])

    render json: @player
  end

  def create
    @player = Player.new(player_params)

    if @player.save
      render json: @player, status: :created, location: api_player_url(@player)
    else
      render json: @player.errors, status: :unprocessable_entity
    end
  end

  private

  def player_params
    params.require(:player).permit(:name)
  end
end
