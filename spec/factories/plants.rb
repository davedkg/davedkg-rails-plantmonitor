# frozen_string_literal: true

FactoryBot.define do
  factory :plant do
    name { Faker::Lorem.word }
    user
  end
end
