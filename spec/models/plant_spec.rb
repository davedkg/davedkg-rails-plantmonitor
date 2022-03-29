# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Plant, type: :model do
  let(:plant_attributes) { attributes_for(:plant) }

  it_behaves_like 'paranoidal'
  it_behaves_like 'purgable'

  describe '#valid?' do
    it 'returns false when name is missing' do
      plant_attributes.delete(:name)

      expect(described_class.new(plant_attributes).valid?).to be(false)
    end
  end
end
