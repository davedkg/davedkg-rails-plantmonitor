# frozen_string_literal: true

require 'rails_helper'

describe 'POST plant_readings_path', type: :request do
  subject { post plant_readings_path, params: { plant_reading: plant_reading_params, api_key: plant.api_key } }

  let(:plant_reading_params) { attributes_for(:plant_reading) }
  let(:plant) { create(:plant) }
  let(:user) { create(:user) }

  before do
    sign_in user
  end

  it 'returns no_content status' do
    subject
    expect(response).to have_http_status(:no_content)
  end

  it 'creates a record' do
    expect do
      subject
    end.to change(PlantReading, :count).by(1)
  end
end
