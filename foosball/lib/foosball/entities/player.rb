require 'lotus/validations'

module Foosball
  module Entities
    class Player
      include Lotus::Validations

      attribute :id
      attribute :name, presence: true, type: String
    end
  end
end
