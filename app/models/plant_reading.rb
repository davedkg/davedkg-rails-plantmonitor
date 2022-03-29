# frozen_string_literal: true

class PlantReading < ApplicationRecord
  belongs_to :plant

  after_create :update_last_seen_at

  default_scope -> { order(created_at: :desc) }

  private

  def update_last_seen_at
    plant.touch(:last_seen_at)
  end
end
