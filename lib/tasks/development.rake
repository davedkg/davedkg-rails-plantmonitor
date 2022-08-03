# frozen_string_literal: true

namespace :development do
  task seed: :environment do
    require_relative Rails.root.join('lib/seeder.rb')

    Seeder.create_users
    Seeder.create_readings_for_user(User.where(role: :admin).first)
  end

  task reset: [
    'db:reset',
    'development:seed',
    'tmp:cache:clear',
    'assets:clean'
  ] do
    # nothing
  end
end
