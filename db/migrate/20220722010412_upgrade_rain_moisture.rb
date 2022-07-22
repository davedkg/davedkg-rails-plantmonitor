class UpgradeRainMoisture < ActiveRecord::Migration[6.1]
  def change
    remove_column :plant_readings, :raining
    add_column :plant_readings, :rain_moisture, :decimal
  end
end
