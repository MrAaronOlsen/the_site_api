class Api::V1::ContentsController < ApplicationController
  def index
    content = Content.all
    render json: content, status: 200
  end

  def update
    content = Content.find(params[:id])

    if content.update(content_params)
      render json: content, status: 200
    else
      render json: { "error"=>"Error Updating Content" }, status: 400
    end
  end

  private

  def content_params
    params.require(:content).permit(:body)
  end
end