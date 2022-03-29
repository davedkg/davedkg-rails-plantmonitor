# frozen_string_literal: true

require 'rails_helper'

describe 'GET plants_path', type: :request do
  subject { get plants_path }

  let(:user) { create(:user) }

  before do
    sign_in user
    create(:plant)
    subject
  end

  it 'returns ok status' do
    expect(response).to have_http_status(:ok)
  end
end
