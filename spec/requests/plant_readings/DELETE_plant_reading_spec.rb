# frozen_string_literal: true

require 'rails_helper'

describe 'DELETE plant_reading_path', type: :request do
  subject { delete plant_plant_reading_path(plant, record) }

  let(:user) { create(:user) }
  let(:plant) { create(:plant, user: user) }
  let(:record) { create(:plant_reading, plant: plant) }

  before do
    sign_in user
  end

  it 'returns redirect status' do
    subject
    expect(response).to have_http_status(:redirect)
  end

  it 'deletes record' do
    expect do
      subject
    end.to change { record.reload.deleted_at }
  end
end
