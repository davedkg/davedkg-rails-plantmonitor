# frozen_string_literal: true

require 'rails_helper'

describe 'GET edit_plant_path', type: :request do
  subject { get edit_plant_path(record) }

  let(:user) { create(:user) }
  let(:record) { create(:plant, user: user) }

  before do
    sign_in user
    subject
  end

  it 'returns ok status' do
    expect(response).to have_http_status(:ok)
  end
end
