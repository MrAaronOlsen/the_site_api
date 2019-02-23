class Api::V1::AttachmentsController < Api::V1::ApiController

  def index
    attachments = Attachment.all
    images = Array.new

    attachments.each do |attachment|
      images << attachment.id
    end

    render json: {images: images}, status: 200
  end

  def show
    id = params[:id]
    attachment = Attachment.find(id)

    data = Base64.encode64(attachment.image.download).gsub("\n", '')
    uri = "data:image/jpg;base64,#{data}"

    render json: {image: uri}, status: 200
  end

  def create
    user_is_admin?

    name = attachment_params.original_filename
    type = attachment_params.content_type

    attachment = Attachment.new(name: name, file_type: type, image: attachment_params)

    if attachment.save
      render json: {id: attachment.id}, status: 200
    else
      render json: {error: attachment.errors.inspect}, status: 422
    end

  end

  def destroy
    user_is_admin?

    if params[:id]
      if Attachment.find(params[:id]).destroy
        render json: { id: id, status: 200 }
      else
        render json: { status: 403 }
      end
    elsif params[:ids]
      if Attachment.where(id: params[:ids]).destroy_all
        render json: { ids: params[:ids], status: 200 }
      else
        render json: { status: 403 }
      end
    end
  end

  def attachment_params
    params.require("attachment")
  end
end