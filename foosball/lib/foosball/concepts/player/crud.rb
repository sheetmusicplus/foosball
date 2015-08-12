require 'foosball/concepts/operation'
require 'foosball/entities/player'

module Foosball
  module Concepts
    module Player
      class List < Concepts::Operation
        def initialize(player_repo:, observer: nil)
          @player_repo  = player_repo
          @observer     = observer || self
        end

        def execute
          run(observer: @observer) do
            [true, @player_repo.all]
          end
        end
      end

      class Create < Concepts::Operation
        def initialize(attributes:, player_repo:, observer: nil)
          @attributes   = attributes
          @player_repo  = player_repo
          @observer     = observer || self
        end

        def execute
          run(observer: @observer) do
            if valid?
              [true, @player_repo.save(player)]
            else
              [false, player]
            end
          end
        end

        def player
          @player ||= Foosball::Entities::Player.new(@attributes)
        end

        def valid?
          player.valid?
        end
      end

      class Read < Concepts::Operation
        def initialize(player_id:, player_repo:, observer: nil)
          @player_id    = player_id
          @player_repo  = player_repo
          @observer     = observer || self
        end

        def execute
          run(observer: @observer) do
            [true, @player_repo.find(@player_id)]
          end
        end
      end
    end
  end
end
