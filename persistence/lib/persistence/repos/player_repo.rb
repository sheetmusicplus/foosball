require 'persistence/private/player'

module Persistence
  module Repos
    class PlayerRepo < Private::Player
      def self.save(player)
        record = self.new(name: player.name)
        record if record.save
      end
    end
  end
end
