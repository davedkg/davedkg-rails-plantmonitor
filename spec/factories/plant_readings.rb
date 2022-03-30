# frozen_string_literal: true

FactoryBot.define do
  factory :plant_reading do
    plant
    soil_moisture { Faker::Number.number(digits: 3) }
    humidity { Faker::Number.decimal(l_digits: 2, r_digits: 2) }
    temperature { Faker::Number.decimal(l_digits: 2, r_digits: 2) }
  end
end
