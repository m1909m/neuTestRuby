class TinymceAssetsController < ApplicationController
  respond_to :json

  def create

    @image = Image.new
    @image.file = image_params[:file]
    @image.save
  #  puts(@image.file_url)
   # render :html => "<script type='text/javascript'>alert('test');</script>".html_safe
   # render :html => "<script>top.$('.mce-btn.mce-open').parent().find('.mce-textbox').val('" + @image.file_url + "');</script>".html_safe


 #   render :plain => "alert('Bitte folgende URL kopieren und in Quelle einfügen: " + @image.file_url + "');"
    render :plain => "$('.mce-combobox .mce-textbox').val('" + @image.file_url + "');"
   # render json: {
   #     location: @image.file_url
   # }, layout: false, content_type: "text/html"
  end

  private
  def image_params
    params.require(:image).permit(:file)
  end
end