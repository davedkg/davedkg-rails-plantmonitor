class CreatePlantReadings < ActiveRecord::Migration[6.1]
  def change
    create_table :plant_readings do |t|
      t.bigint :plant_id, null: false
      t.decimal :soil_moisture
      t.decimal :humidity
      t.decimal :temperature
      t.datetime :deleted_at, precision: 6
      t.timestamps
    end
    add_index :plant_readings, [:deleted_at, :plant_id, :created_at]
  end
end