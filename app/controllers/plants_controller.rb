# frozen_string_literal: true

class PlantsController < ApplicationController
  before_action :set_plant, except: %i[index new create]

  breadcrumb -> { page_title_hash[:index] }, :plants_path, except: [:index], if: -> { policy(Plant).index? }
  breadcrumb lambda {
               page_title_hash[:show]
             }, -> { plant_path(@plant) }, only: %i[edit update], if: -> { policy(@plant).edit? }

  def index
    @plants = authorize policy_scope(Plant).includes(:user).page(params[:page])
  end

  def show
    @plant_readings = @plant.plant_readings.includes(plant: :user).page(0)
  end

  def edit; end

  def new
    @plant = authorize Plant.new
  end

  def create
    @plant = authorize Plant.new
    @plant.attributes = permitted_attributes(@plant)
    @plant.user = current_user

    if @plant.save
      redirect_to plant_path(@plant), notice: 'Plant was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @plant.update(permitted_attributes(@plant))
      redirect_to plant_path(@plant), notice: 'Plant was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @plant.destroy
    redirect_to plants_path, notice: 'Plant was successfully destroyed.'
  end

  private

  def set_plant
    @plant = authorize policy_scope(Plant).find(params[:id])
  end

  def page_title_hash
    super.merge({
                  show: @plant&.name
                })
  end
end
