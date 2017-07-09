
class ContactMailer < ActionMailer::Base
  default from: 'info@vkm.de'
  def contact_email(contactForm)
    @contactForm = contactForm
    @email = "info@vkm-rwl.de"
    mail :to=> @email,
         :subject=> "Kontaktaufnahme"
  end

  def change_diakonie(diakonie)
    @content = diakonie
    @email = "verbandkirchlichermmitarbeiter@gmail.com"
    mail :to=> @email,
         :subject=> "Diakonie Seite wurde verändert"
  end

  def change_gbb(gbb)
    @content = gbb
    @email = "verbandkirchlichermmitarbeiter@gmail.com"
    mail :to=> @email,
         :subject=> "GBB Seite wurde verändert"
  end

  def change_pädagogik(pädagogik)
    @content = pädagogik
    @email = "verbandkirchlichermmitarbeiter@gmail.com"
    mail :to=> @email,
         :subject=> "Pädagogik Seite wurde verändert"
  end

  def change_haustechnik_westfalen(hWestfalen)
    @content = hWestfalen
    @email = "verbandkirchlichermmitarbeiter@gmail.com"
    mail :to=> @email,
         :subject=> "Hauswirtschaft / Haustechnik Westfalen / Lippe Seite wurde verändert"
  end

  def change_hUndh_Rheinland(rheinland)
    @content = rheinland
    @email = "verbandkirchlichermmitarbeiter@gmail.com"
    mail :to=> @email,
         :subject=> "Hauswirtschaft und Haustechnik Rheinland Seite wurde verändert"
  end

  def create_event(email, password, event)
    @event = event
    @password = password
    @email = email
    mail :to=> @email,
         :subject=> "Neue Veranstaltung erstellt"
  end

  def change_event(member, event)
    @member = member
    @event = event
    @email = @member.eMail
    mail :to=> @email,
         :subject=> "Änderungen einer Veranstalltung von der VKM"
  end


  def accept_eveent(member, event)
    @member = member
    @event = event
    @email = @member.eMail
    mail :to => @email,
        :subject => "Ihre Bestätigung zu der Veranstaltung \"" + @event.title + "\""
  end

  def storno_event(member, event)
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
    mail :to=> "elke.vonkolken@vkm-rwl.de",
         :subject=> "Neue Anmeldung zu einer Veranstalltung"
  end

  def new_schulung(schulung)
    @schulung = schulung
    mail :to=> "Susanne.Hohmann@vkm-rwl.de",
         :subject=> "Neue Anfrage auf In House Schulung"
  end

  def new_user(username, password)
    @username = username
    @password = password
    @email = "verbandkirchlichermmitarbeiter@gmail.com"
    mail :to=> @email,
         :subject=> "Neuer Benutzer wurde angelegt"
  end

end