class TinymceAssetsController < ApplicationController
  respond_to :json

  def create

    @image = Image.create params.permit(:file, :alt, :hint)

    render json: {
        image: {
            url:    @image.file.url,
            height: 250,
            width:  250
        }
    }, layout: false, content_type: "text/html"
  end
end