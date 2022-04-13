class AddLightIntensityToPlantReading < ActiveRecord::Migration[6.1]
  def change
    add_column :plant_readings, :light_intensity, :decimal, default: 0.0
  end
end
