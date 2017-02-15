class ContactFormsController < ApplicationController

  def new
    @contact_form = ContactForm.new
  end

  def create
    begin
      @contact_form = ContactForm.new(params[:contact_form])
      @contact_form.request = request
      if @contact_form.deliver
        flash.now[:notice] = 'Danke für Ihre Nachricht!'
      else
        render :new
      end
    rescue ScriptError
      flash[:error] = 'Schuldige, Nachricht wurde nicht versendet.'
    end
  end
end