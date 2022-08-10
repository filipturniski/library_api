include ActionController::HttpAuthentication::Basic::ControllerMethods
include ActionController::HttpAuthentication::Token::ControllerMethods
class AuthenticateMember < ActionController::API
  before_action :authenticate

  protected

  def authenticate

    authenticate_or_request_with_http_basic do |username, password|

      begin
        if User.searchActiveMemeberUsername(username).first.password_ciphertext == password
          params[:member_id] = User.searchActiveMemeberUsername(username).first.id
        else
          render json: {message: 'wrong login password'}, status: 401
        end
      rescue
        render json: {message: 'wrong login username'}, status: 401
      end

    end
  end
end