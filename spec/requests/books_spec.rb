# frozen_string_literal: true
require 'rails_helper'

describe 'Books API', type:  :request do
  it 'return all books' do
    get '/api/v1/catalog/book'
    expect(response).to have_http_status(:ok)
    expect(JSON.parse(response.body)['data'].length).to eq(6)
  end

end