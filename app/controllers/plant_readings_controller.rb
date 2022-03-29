# frozen_string_literal: true

class PlantReadingsController < ApplicationController
  before_action :set_plant
  before_action :set_plant_reading, except: %i[index create]

  def index
    @plant_readings = authorize @plant.plant_readings.includes(plant: :user).page(params[:page])
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

  def destroy
    @plant_reading.destroy

    redirect_to plant_path(@plant), notice: 'Reading was successfully destroyed.'
  end

  private

  def set_plant_reading
    @plant_reading = authorize @plant.plant_readings.find(params[:id])
  end

  # :reek:DuplicateMethodCall
  def set_plant
    @plant = if params[:api_key]
               Plant.find_by(api_key: params[:api_key])
             else
               Plant.find(params[:plant_id])
             end
  end
end
