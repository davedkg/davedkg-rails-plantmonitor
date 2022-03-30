class AddRainingReading < ActiveRecord::Migration[6.1]
  def change
    add_column :plant_readings, :raining, :boolean, default: false
  end
end
