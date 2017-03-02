
class ContactMailer < ActionMailer::Base
  default from: 'info@vkm.de'
  def contact_email(contactForm)
    @contactForm = contactForm
    @email = "verbandkirchlichermmitarbeiter@gmail.com"
    mail :to=> @email,
         :subject=> "Kontaktaufnahme"
  end
end