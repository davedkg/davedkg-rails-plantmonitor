# frozen_string_literal: true

class Seeder
  def self.create_users
    users_file = File.read(Rails.root.join('db/seeds/users.json'))
    JSON.parse(users_file).each do |user_json|
      build_user(user_json).save
    end
  end

  def self.build_user(user_json)
    time_current = Time.current

    User.new(
      name: user_json['name'],
      email: user_json['email'],
      password: user_json['password'],
      confirmed_at: time_current,
      invitation_accepted_at: time_current,
      role: (user_json['role'] || User.roles[:user])
    )
  end

  def self.create_readings_for_user(user)
    plant = Plant.create(name: 'Plant 1', user: user)
    current_time = Time.zone.now
    start_time = current_time - 30.days

    while current_time > start_time
      plant_reading = PlantReading.new(plant: plant)
      plant_reading.soil_moisture = rand(500...900)
      plant_reading.humidity = rand(20.0...99.9).round(1)
      plant_reading.temperature = rand(16.0...35.0).round(1)
      plant_reading.light_intensity = rand(200...1000)
      plant_reading.rain_moisture = rand(500...1000)
      plant_reading.created_at = current_time
      plant_reading.save

      current_time -= 15.minutes
    end
  end
end
