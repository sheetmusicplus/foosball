require 'foosball_cli/version'

require 'dotenv'
Dotenv.load

require 'foosball'
require 'persistence'

ActiveRecord::Base.establish_connection(ENV['DATABASE_URL'])

module FoosballCli
  extend self

  def all_players
    Foosball.present_players({ player_repo: player_repo })
  end

  private

  def player_repo
    Persistence::Repos::PlayerRepo
  end
end
