class Api::PlayersController < ApplicationController
  def index
    Foosball.present_players(
      player_repo:  player_repo,
      observer:     self
    ) do |o|
      o.on_success -> (observer, players) {
        observer.render_players(players)
      }
    end
  end

  def show
    Foosball.present_player(
      player_id:    params[:id],
      player_repo:  player_repo,
      observer:     self
    ) do |o|
      o.on_success -> (observer, player) {
        observer.render_player(player)
      }
    end
  end

  def create
    Foosball.create_player(
      attributes:   player_params,
      player_repo:  player_repo,
      observer:     self
    ) do |o|
      o.on_success -> (observer, player) {
        observer.render_player_created(player)
      }

      o.on_errors -> (observer, player) {
        observer.render_player_with_errors(player)
      }
    end
  end

  def render_players(players)
    render json: players, each_serializer: player_serializer
  end

  def render_player(player)
    render json: player, serializer: player_serializer
  end

  def render_player_created(player)
    render json: player, serializer: player_serializer, status: :created, location: api_player_url(player)
  end

  def render_player_with_errors(player)
    render json: player.errors, status: :unprocessable_entity
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
