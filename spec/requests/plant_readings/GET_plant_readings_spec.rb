# frozen_string_literal: true

require 'rails_helper'

describe 'GET plant_readings_path', type: :request do
  subject { get plant_plant_readings_path(plant), xhr: true }

  let(:plant) { create(:plant) }
  let(:user) { create(:user) }

  before do
    create(:plant_reading, plant: plant)
    sign_in user
    subject
  end

  it 'returns ok status' do
    expect(response).to have_http_status(:ok)
  end
end
