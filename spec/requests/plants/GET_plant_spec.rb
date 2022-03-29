# frozen_string_literal: true

require 'rails_helper'

describe 'GET plant_path', type: :request do
  subject { get plant_path(record) }

  let(:user) { create(:user) }
  let(:record) { create(:plant) }

  before do
    sign_in user
    subject
  end

  it 'returns ok status' do
    expect(response).to have_http_status(:ok)
  end
end
