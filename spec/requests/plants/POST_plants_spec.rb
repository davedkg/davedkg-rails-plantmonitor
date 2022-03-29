# frozen_string_literal: true

require 'rails_helper'

describe 'POST plants_path', type: :request do
  subject { post plants_path, params: { plant: plant_params } }

  let(:plant_params) { attributes_for(:plant) }
  let(:user) { create(:user) }

  before do
    sign_in user
  end

  it 'returns redirect status' do
    subject
    expect(response).to have_http_status(:redirect)
  end

  it 'creates a record' do
    expect do
      subject
    end.to change(Plant, :count).by(1)
  end
end
