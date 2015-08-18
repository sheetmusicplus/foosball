require 'faker'
require 'foosball/entities/player'

Fabricator(:player, from: Persistence::Private::Player) do
  name { Faker::Name.name }
end

Fabricator(:player_entity, from: Foosball::Entities::Player) do
  name { Faker::Name.name }
end
