# frozen_string_literal: true

require 'rails_helper'

describe 'DELETE plant_path', type: :request do
  subject { delete plant_path(record) }

  let(:user) { create(:user) }
  let(:record) { create(:plant, user: user) }

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
