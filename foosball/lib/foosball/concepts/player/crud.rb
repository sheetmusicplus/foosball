require 'foosball/entities/player'

module Foosball
  module Concepts
    module Player
      class List
        def initialize(player_repo:)
          @player_repo  = player_repo
        end

        def execute
          @player_repo.all
        end
      end

      class Create
        def initialize(attributes:, player_repo:)
          @attributes   = attributes
          @player_repo  = player_repo
        end

        def execute
          @player_repo.save(player) if valid?
        end

        def player
          @player ||= Foosball::Entities::Player.new(@attributes)
        end

        def valid?
          player.valid?
        end
      end

      class Read
        def initialize(player_id:, player_repo:)
          @player_id    = player_id
          @player_repo  = player_repo
        end

        def execute
          @player_repo.find(@player_id)
        end
      end
    end
  end
end
