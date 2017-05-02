
class ContactMailer < ActionMailer::Base
  default from: 'info@vkm.de'
  def contact_email(contactForm)
    @contactForm = contactForm
    @email = "verbandkirchlichermmitarbeiter@gmail.com"
    mail :to=> @email,
         :subject=> "Kontaktaufnahme"
  end

  def change_diakonie(diakonie)
    @content = diakonie
    @email = "verbandkirchlichermmitarbeiter@gmail.com"
    mail :to=> @email,
         :subject=> "Diakonie Seite wurde verändert"
  end

  def change_event(member, event)
    @member = member
    @event = event
    @email = @member.eMail
    mail :to=> @email,
         :subject=> "Änderungen einer Veranstalltung von der VKM"
  end

  def new_member(member, event)
    @member = member
    @event = event
    @email = @member.eMail
    mail :to=> @email,
         :subject=> "Anmeldung einer Veranstalltung von der VKM"
  end

  def new_member_vkm(member, event)
    @member = member
    @event = event
    @email = @member.eMail
    mail :to=> "verbandkirchlichermmitarbeiter@gmail.com",
         :subject=> "Anmeldung einer Veranstalltung von der VKM"
  end


end