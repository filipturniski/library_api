module AuthHelper
  def http_login
    user = 'ppseric'
    pw = '12345678'
    request.env['HTTP_AUTHORIZATION'] = ActionController::HttpAuthentication::Basic.encode_credentials(user,pw)
  end
end