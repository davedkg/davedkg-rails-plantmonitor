# frozen_string_literal: true

require 'rails_helper'

describe 'GET ping_path', type: :request do
  before do
    get ping_path
  end

  it 'returns no_content status' do
    expect(response).to have_http_status(:no_content)
  end
end
