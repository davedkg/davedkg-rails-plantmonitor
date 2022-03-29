# frozen_string_literal: true

require 'rails_helper'

describe 'PATCH plant_path', type: :request do
  subject { patch plant_path(record), params: { plant: plant_params } }

  let(:plant_params) { attributes_for(:plant) }
  let(:user) { create(:user) }
  let(:record) { create(:plant, user: user) }

  before do
    sign_in user
  end

  it 'returns redirect status' do
    subject
    expect(response).to have_http_status(:redirect)
  end

  it 'updates record' do
    expect do
      subject
    end.to change { record.reload.updated_at }
  end
end
