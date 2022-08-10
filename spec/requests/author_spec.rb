# frozen_string_literal: true
require 'rails_helper'

describe 'Catalog Author API', type:  :request do
  it 'return all Author' do
    get '/api/v1/catalog/author'
    expect(response).to have_http_status(:ok)
    expect(JSON.parse(response.body)['data'].length).to eq(6)
  end

  it 'return filer Author' do
    get '/api/v1/catalog/author?authorName=ok1'
    expect(response).to have_http_status(:ok)
    expect(JSON.parse(response.body)['data'].length).to eq(1)
  end

end

describe 'Management Books API', type:  :request do

  it 'test no authentification' do
    get '/api/v1/management/author'
    expect(response).to have_http_status(401)
  end

  def http_login_wrong_user
    user = 'ppserics'
    password = '12345678'
    {
      HTTP_AUTHORIZATION: ActionController::HttpAuthentication::Basic.encode_credentials(user,password)
    }
  end

  def http_login_wrong_password
    user = 'ppseric'
    password = '12345678s'
    {
      HTTP_AUTHORIZATION: ActionController::HttpAuthentication::Basic.encode_credentials(user,password)
    }
  end

  def http_login
    user = 'ppseric'
    password = '12345678'
    {
      HTTP_AUTHORIZATION: ActionController::HttpAuthentication::Basic.encode_credentials(user,password)
    }
  end

  def second_http_login
    user = 'pštevic'
    password = '12345678'
    {
      HTTP_AUTHORIZATION: ActionController::HttpAuthentication::Basic.encode_credentials(user,password)
    }
  end

  it 'test authentification ' do

    get '/api/v1/management/author?authorName=Author1', headers: http_login_wrong_user
    expect(response).to have_http_status(401)
    expect(JSON.parse(response.body)['message']).to eq('wrong login username')
    get '/api/v1/management/author?authorName=Author1', headers: http_login_wrong_password

    get '/api/v1/management/author?authorName=Author1', headers: http_login
    expect(response).to have_http_status(:ok)
    expect(JSON.parse(response.body)['data'].length).to eq(1)
  end

  it 'create author ' do
    post '/api/v1/management/author?name_author=novi autor', params: '', headers: second_http_login
    expect(response).to have_http_status(201)
    expect(JSON.parse(response.body)['data']['name_author']).to eq('novi autor')
    expect(JSON.parse(response.body)['data']['updater_id']).to eq(3)
    expect(JSON.parse(response.body)['data']['creator_id']).to eq(3)
  end

  it 'update author ' do
    put '/api/v1/management/author/7?name_author=novo ime1&status_id=4', params: '', headers: second_http_login
    expect(response).to have_http_status(202)
    expect(JSON.parse(response.body)['data'].length).to eq(1)
    expect(JSON.parse(response.body)['data'][0]['name_author']).to eq('novo ime1')
    expect(JSON.parse(response.body)['data'][0]['updater_id']).to eq(3)
    expect(JSON.parse(response.body)['data'][0]['creator_id']).to eq(1)
    expect(JSON.parse(response.body)['data'][0]['status_id']).to eq(4)

    put '/api/v1/management/author/70?name_author=novo ime1', params: '', headers: second_http_login
    expect(response).to have_http_status(422)
    expect(JSON.parse(response.body)['message']).to eq('wrong Author id')


  end

  it 'delete author ' do
    delete '/api/v1/management/author/6', params: '', headers: second_http_login
    expect(response).to have_http_status(202)
    expect(JSON.parse(response.body)['data'].length).to eq(1)
    expect(JSON.parse(response.body)['data'][0]['updater_id']).to eq(3)
    expect(JSON.parse(response.body)['data'][0]['creator_id']).to eq(1)
    expect(JSON.parse(response.body)['data'][0]['status_id']).to eq(5)

    put '/api/v1/management/author/70?name_author=novo ime1', params: '', headers: http_login
    expect(response).to have_http_status(422)
    expect(JSON.parse(response.body)['message']).to eq('wrong Author id')

  end

end