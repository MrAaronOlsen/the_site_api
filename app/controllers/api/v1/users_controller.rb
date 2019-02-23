class Api::V1::UsersController < Api::V1::ApiController

  def show

    if @current_requester
      render json: @current_requester, status: 200
    else
      render json: "Invalid User", status: 401
    end
  end
end