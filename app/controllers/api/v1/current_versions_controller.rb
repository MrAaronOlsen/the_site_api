class Api::V1::CurrentVersionsController < Api::V1::ApiController

  def update
    user_is_admin?
    
    current_version = CurrentVersion.find_by(model: params[:model])

    if current_version.update({version: params[:id]})
      render json: current_version, status: 200
    else
      render json: {}, status: 403
    end
  end

  private

  def current_versions_params
    params.permit(:current_version).require(:id)
  end
end