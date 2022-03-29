# frozen_string_literal: true

class Plant < ApplicationRecord
  belongs_to :user
  has_many :plant_readings, dependent: :destroy

  validates :name, presence: true

  before_create :set_api_key

  private

  def set_api_key
    loop do
      self.api_key = SecureRandom.hex(16)
      break unless 0 != Plant.where(api_key: api_key).count
    end
  end
end
