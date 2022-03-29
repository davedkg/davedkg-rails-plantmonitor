# frozen_string_literal: true

class PlantReadingsController < ApplicationController
  before_action :set_plant

  def index
    @plant_readings = authorize @plant.plant_readings.page(params[:page])
  end

  def create
    @plant_reading = authorize PlantReading.new
    @plant_reading.attributes = permitted_attributes(@plant_reading)
    @plant_reading.plant = @plant

    if @plant_reading.save
      head :no_content
    else
      render status: :unprocessable_entity
    end
  end

  private

  def set_plant
    @plant = if params[:api_key]
               Plant.find_by(api_key: params[:api_key])
             else
               Plant.find(params[:plant_id])
             end
  end
end
