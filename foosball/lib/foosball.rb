require 'foosball/version'

require 'foosball/concepts/player/crud'

module Foosball
  extend self

  include Concepts

  def present_players(*args)
    Player::List.new(*args).execute
  end

  def present_player(*args, &block)
    Player::Read.new(*args).execute
  end

  def create_player(*args)
    Player::Create.new(*args).execute
  end
end
