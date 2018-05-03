class ContactFormsController < ApplicationController

  def new
    @contact_form = ContactForm.new
  end

  def create
    begin
      @contact_form = ContactForm.new(contactForms_params)
      #@contact_form.request = request
      if @contact_form.save
        if ContactMailer.contact_email(@contact_form).deliver

            flash.now[:notice] = 'Danke für Ihre Nachricht!'

        else
          render :new
        end
      end
    rescue ScriptError
      flash[:error] = 'Schuldige, Nachricht wurde nicht versendet.'
    end
  end

  private

  def contactForms_params
    params.require(:contact_form).permit(:name, :email, :message, :accept)
  end
end