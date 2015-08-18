FactoryGirl.define do
  factory :match, class: 'Persistence::Private::Match' do
    association :winner, factory: :player
    association :loser, factory: :player
    occured_at { DateTime.now.getutc }
  end

  factory :player, class: 'Persistence::Private::Player' do
    name { Faker::Name.name }
  end
end
