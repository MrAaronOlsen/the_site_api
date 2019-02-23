class Api::V1::ApiController < ApplicationController
  before_action :authenticate_requester

  def user_is_admin?

    if @current_requester.admin?
      puts "\n*** Permitting Admin User #{@current_requester.name} ***\n\n"
    else
      render json: { "error"=>"Forbidden" }, status: 403
    end
  end

  private

  def authenticate_requester
    current_requester
  end

  def current_requester
    @current_requester ||= User.find(JwtToken.decode(parse_request)["user_id"])

    if @current_requester.nil?
      render json: { "error"=>"Invalid User" }, status: 401
    end
  end

  def parse_request
    request.env['HTTP_AUTHENTICATION'].match(/^Bearer (.*)/)[1]
  end
end