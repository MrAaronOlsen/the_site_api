class Api::V1::AboutsController < Api::V1::ApiController

  def index
    about = About.all
    render json: about, status: 200
  end

  def current
    current_version = CurrentVersion.find_by(model: 'About')

    if current_version

      current_about = About.find(current_version.version)

      if current_about
        render json: current_about, :joins => :attachments, status: 200
      else
        render json: "No About found by version #{current_version.version}", status: 204
      end
    else
      render json: 'No Current About Version', status: 204
    end
  end

  def update
    user_is_admin?

    if params[:id] == "undefined"
      if About.create(content_params)
        render json: "Created New Record", status: 200
      end
    end

    about = About.find(params[:id])

    if about.update(body: params[:body])
      render json: about, status: 200
    else
      render json: { "error"=>"Error Updating Content" }, status: 400
    end

  end

  def images
    user_is_admin?

    about = About.find(params[:id])
    images = Attachment.where(id: params[:attachments]).all

    if about.update(attachments: images)
      render json: about, status: 200
    else
      render json: { "error"=>"Error Updating Content" }, status: 400
    end
  end

  private

  def content_params
    params.require(:about).permit(:name, :body, :attachments)
  end
end