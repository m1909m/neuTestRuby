class TinymceAssetsController < ApplicationController
  respond_to :json

  def create

    @image = Image.new
    @image.file = image_params[:file]
    @image.save
    puts(@image.file_url)
    render json: {
        image: {
            url:    @image.file_url,
            height: 250,
            width:  250
        }
    }, layout: false, content_type: "text/html"
  end

  private
  def image_params
    params.require(:image).permit(:file)
  end
end