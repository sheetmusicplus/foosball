require 'persistence/private/player'

module Persistence
  module Repos
    class PlayerRepo
      def all
        Private::Player.all.order(:name)
      end

      def find(player_id)
        Private::Player.find(player_id)
      end

      def save(player)
        if player.id.nil?
          Private::Player.create(name: player.name)
        else
          Private::Player.update(player.id, name: player.name)
        end
      end
    end
  end
end
