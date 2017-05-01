class TinymceAssetsController < ApplicationController
  respond_to :json

  def create

    @image = Image.new
    @image.file = params.permit(:image)
    @image.save
    render json: {
        image: {
            url:    @image.attachment_url,
            height: 250,
            width:  250
        }
    }, layout: false, content_type: "text/html"
  end
end