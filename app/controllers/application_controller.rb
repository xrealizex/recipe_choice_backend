class ApplicationController < ActionController::Base
  include DeviseTokenAuth::Concerns::SetUserByToken
  skip_before_action :verify_authenticity_token
  helper_method :current_user, :user_signed_in?

  after_action :set_access_control_headers

  private

  def set_access_control_headers
    response.headers['Access-Control-Allow-Origin'] = 'https://web.recipe-choice.shop'
    response.headers['Access-Control-Allow-Methods'] = 'GET, POST, PUT, PATCH, DELETE, OPTIONS'
    response.headers['Access-Control-Allow-Headers'] = 'Origin, Content-Type, Accept, Authorization, Token'
  end
end
