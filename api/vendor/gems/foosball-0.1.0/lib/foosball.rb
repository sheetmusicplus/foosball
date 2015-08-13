require 'foosball/version'

require 'foosball/concepts/player/crud'

module Foosball
  extend self

  include Concepts

  def present_players(*args, &block)
    execute_operation Player::List, *args, &block
  end

  def present_player(*args, &block)
    execute_operation Player::Read, *args, &block
  end

  def create_player(*args, &block)
    execute_operation Player::Create, *args, &block
  end

  private

  def execute_operation(operation_class, *args, &block)
    operation = operation_class.new(*args)
    yield operation if block_given?
    operation.execute
  end
end
