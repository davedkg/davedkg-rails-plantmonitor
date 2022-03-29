# frozen_string_literal: true

require 'rails_helper'

RSpec.describe PlantPolicy, type: :policy do
  subject { described_class.new(user, record) }

  let(:user) { create(:user) }
  let(:record) { create(:plant) }

  it { is_expected.to permit_actions(%i[index show new create]) }
  it { is_expected.to forbid_actions(%i[edit update destroy]) }
  it { expect(subject).to permit_mass_assignment_of_exactly([:name]) }

  context 'when plant is mine' do
    let(:record) { create(:plant, user: user) }

    it { is_expected.to permit_actions(%i[edit update destroy]) }
  end
end
