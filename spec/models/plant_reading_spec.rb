# frozen_string_literal: true

require 'rails_helper'

RSpec.describe PlantReading, type: :model do
  let(:plant_reading_attributes) { attributes_for(:plant_reading) }
  let(:plant) { create(:plant) }

  it_behaves_like 'paranoidal'
  it_behaves_like 'purgable'

  describe '#create' do
    subject { create(:plant_reading, plant: plant) }

    it 'updates plant.last_seen_at' do
      expect { subject }.to change(plant, :last_seen_at)
    end
  end
end
