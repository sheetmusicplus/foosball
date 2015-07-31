FactoryGirl.define do
  factory :match do
    association :winner, factory: :player
    association :loser, factory: :player
    occured_at { DateTime.now.getutc }
  end

  factory :player do
    name { Faker::Name.name }
  end
end
