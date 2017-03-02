class ContactFormsController < ApplicationController

  def new
    @contact_form = ContactForm.new
  end

  def create
    begin
      @contact_form = ContactForm.new(contactForms_params)
      @contact_form.request = request
      if @contact_form.deliver
        if @contact_form.save
          flash.now[:notice] = 'Danke für Ihre Nachricht!'
        end
      else
        render :new
      end
    rescue ScriptError
      flash[:error] = 'Schuldige, Nachricht wurde nicht versendet.'
    end
  end

  private

  def contactForms_params
    params.require(:contact_forms).permit(:name, :email, :message)
  end
end