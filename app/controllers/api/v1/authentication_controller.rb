class Api::V1::AuthenticationController < ActionController::API

  def create
    user = User.find_by(name: auth_params[:name])

    if (user.authenticate(auth_params[:password]))
      token = JwtToken.encode({user_id: user.id})
      render json: {token: token, name: auth_params[:name]}, status: 200
    end
  end

  private

  def auth_params
    params.require(:authentication).permit(:name, :password)
  end
end