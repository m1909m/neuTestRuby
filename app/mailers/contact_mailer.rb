

class ContactMailer < ActionMailer::Base

  default from: 'info@vkm-rwl.de'

  def contact_email(contactForm)

    @contactForm = contactForm

    @email = "info@vkm-rwl.de"

    mail :to=> @email,

         :subject=> "Kontaktaufnahme"

  end



  def change_diakonie(diakonie)

    @content = diakonie

    @email = "system@vkm-rwl.de"

    mail :to=> @email,

         :subject=> "Diakonie Seite wurde veraendert"

  end



  def change_gbb(gbb)

    @content = gbb

    @email = "system@vkm-rwl.de"

    mail :to=> @email,

         :subject=> "GBB Seite wurde veraendert"

  end



  def change_paedagogik(paedagogik)

    @content = paedagogik

    @email = "system@vkm-rwl.de"

    mail :to=> @email,

         :subject=> "Paedagogik Seite wurde veraendert"

  end



  def change_haustechnik_westfalen(hWestfalen)

    @content = hWestfalen

    @email = "system@vkm-rwl.de"

    mail :to=> @email,

         :subject=> "Hauswirtschaft / Haustechnik Westfalen / Lippe Seite wurde veraendert"

  end



  def change_hUndh_Rheinland(rheinland)

    @content = rheinland

    @email = "system@vkm-rwl.de"

    mail :to=> @email,

         :subject=> "Hauswirtschaft und Haustechnik Rheinland Seite wurde veraendert"

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

    @user = User.where( email: @event.accountName)

    @crypt = ActiveSupport::MessageEncryptor.new("<\xE4i\x8BB\xD1[\x98{\x9F\xDE1\xC6u\x06\xFC\xF8!\xC6\xED\xFEh\xAF\xF5\xA2\xE8\xC6jy,\x19/1\xBB\xEE\x9Es\xA3(\x971\xD3\xBFR!8\x13\xB8\xCDV\xD7\x03\xC8R@v\xF5.\xCF\xBAA\x890\xD8")

    @pass = @crypt.decrypt_and_verify(@user[0].passwordEncrypt)

    @email = @member.eMail

    mail :to=> @email,

         :subject=> "Aenderungen einer Veranstaltung von der VKM"

  end





  def accept_event(member, event, room, user, pass)

    @member = member

    @event = event

    @room = room

    @user = user

    @pass = pass

    @email = @member.eMail

    mail :to => @email,

        :subject => "Ihre Bestaetigung zu der Veranstaltung \"" + @event.title + "\""

  end

  def accept_event_not_user(member, event, room)
    @member = member
    @event = event
    @room = room
    @email = @member.eMail
    mail :to => @email,
         :subject => "Ihre Bestaetigung zu der Veranstaltung \"" + @event.title + "\""
  end

  def abmelden_event(member, event)
    @member = member
    @event = event
    @email = @member.eMail

    mail :to=> @email,

         :subject=> "Information zur Teilnahme am Seminar \"" + @event.title + "\""
  end

  def abmelden_event_vkm(member, event)
    @member = member
    @event = event
    @email = @member.eMail

    mail :to=> "elke.vonkolken@vkm-rwl.de",

         :subject=> "Abmeldung zur Teilnahme am Seminar \"" + @event.title + "\" des Teilnehmers \"" + @member.lastName + "\""
  end

  def storno_event(member, event)

    @member = member

    @event = event

    @email = @member.eMail

    mail :to=> @email,

         :subject=> "Information zur Teilnahme am Seminar \"" + @event.title + "\""

  end



  def new_member(member, event)

    @member = member

    @event = event

    @email = @member.eMail

    mail :to=> @email,

         :subject=> "Anmeldung einer Veranstaltung von der VKM"

  end



  def new_member_vkm(member, event)

    @member = member

    @event = event

    @email = @member.eMail

    mail :to=> "elke.vonkolken@vkm-rwl.de",

         :subject=> "Neue Anmeldung zu der Veranstaltung \"" + @event.title + "\""

  end



  def new_schulung(schulung)

    @schulung = schulung

    mail :to=> "susanne.hohmann@vkm-rwl.de",

         :subject=> "Neue Anfrage auf In House Schulung"

  end



  def new_user(username, password)

    @username = username

    @password = password

    @email = "system@vkm-rwl.de"

    mail :to=> @email,

         :subject=> "Neuer Benutzer wurde angelegt"

  end



end