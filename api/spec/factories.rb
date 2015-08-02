FactoryGirl.define do
  factory :match, class: 'Persistence::Repos::MatchRepo' do
    association :winner, factory: :player
    association :loser, factory: :player
    occured_at { DateTime.now.getutc }
  end

  factory :player, class: 'Persistence::Repos::PlayerRepo' do
    name { Faker::Name.name }
  end
end
