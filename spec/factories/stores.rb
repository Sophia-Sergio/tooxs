require 'faker'

FactoryGirl.define do
  factory :store do
    name { Faker::WorldOfWarcraft.hero }
    street { Faker::Address.street_name }
    number { Faker::Address.building_number }
    city { Faker::Address.city }
    district { Faker::Address.state }
    country { Faker::Address.country }
  end
end
