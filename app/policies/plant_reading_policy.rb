# frozen_string_literal: true

class PlantReadingPolicy < ApplicationPolicy
  def index?
    true
  end

  def create?
    true
  end

  def destroy?
    mine?
  end

  def permitted_attributes
    %i[soil_moisture humidity temperature raining light_intensity]
  end

  private

  def mine?
    record.plant.user == user
  end
end
