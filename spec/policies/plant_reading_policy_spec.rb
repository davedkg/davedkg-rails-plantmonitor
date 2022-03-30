# frozen_string_literal: true

require 'rails_helper'

RSpec.describe PlantReadingPolicy, type: :policy do
  subject { described_class.new(user, record) }

  let(:user) { create(:user) }
  let(:plant) { create(:plant) }
  let(:record) { create(:plant_reading, plant: plant) }

  it { is_expected.to permit_actions(%i[index create]) }
  it { is_expected.to forbid_actions(%i[destroy]) }
  it { expect(subject).to permit_mass_assignment_of_exactly(%i[soil_moisture humidity temperature]) }

  context 'when plant is mine' do
    let(:plant) { create(:plant, user: user) }

    it { is_expected.to permit_actions(%i[destroy]) }
  end
end
