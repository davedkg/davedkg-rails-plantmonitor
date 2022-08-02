# frozen_string_literal: true

module PlantReadingsHelper
  def plant_readings_24_hour_graph(plant)
    end_time = Time.zone.now
    start_time = end_time - 23.hours
    plant_readings = plant.plant_readings.unscope(:order).group_by_hour(:created_at, range: start_time..end_time)

    plant_readings_graph(plant_readings)
  end

  def plant_readings_graph(plant_readings)
    data = {}
    data[:controller] = 'plant-readings-graph'
    data['plant-readings-graph-soil-moisture']   = plant_readings.average(:soil_moisture).map { |_k, v| v.to_f }
    data['plant-readings-graph-humidity']        = plant_readings.average(:humidity).map { |_k, v| v.to_f }
    data['plant-readings-graph-temperature']     = plant_readings.average(:temperature).map { |_k, v| v.to_f }
    data['plant-readings-graph-light-intensity'] = plant_readings.average(:light_intensity).map { |_k, v| v.to_f }
    data['plant-readings-graph-rain-moisture']   = plant_readings.average(:rain_moisture).map { |_k, v| v.to_f }

    content_tag(:div, class: 'plant-readings-graph', data: data) do
      concat ''
    end
  end
end
