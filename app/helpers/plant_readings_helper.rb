# frozen_string_literal: true

module PlantReadingsHelper
  def plant_readings_24_hour_chart(plant)
    end_time = Time.zone.now
    start_time = end_time - 23.hours
    plant_readings = plant.plant_readings.unscope(:order).group_by_hour(:created_at, range: start_time..end_time)

    data = {}
    data[:controller] = 'plant-readings-24-hour-chart'
    data['plant-readings-24-hour-chart-soil-moisture']   = plant_readings.average(:soil_moisture).map { |_k, v| v.to_f }
    data['plant-readings-24-hour-chart-humidity']        = plant_readings.average(:humidity).map { |_k, v| v.to_f }
    data['plant-readings-24-hour-chart-temperature']     = plant_readings.average(:temperature).map { |_k, v| v.to_f }
    data['plant-readings-24-hour-chart-light-intensity'] = plant_readings.average(:light_intensity).map { |_k, v| v.to_f }
    data['plant-readings-24-hour-chart-rain-moisture']   = plant_readings.average(:rain_moisture).map { |_k, v| v.to_f }

    content_tag(:div, class: 'plant-readings-24-hour-chart', data: data) do
      concat ''
    end
  end
end
