

class BookingMailer < ActionMailer::Base

  default from: 'info@vkm-rwl.de'

  def booking_email(person, articles, card)

    @person = person

    @articles = articles

    @card = card
    if @person.email != ""
      @email = @person.email
    else
      @email = @person.emailD
    end
    @sum = 0.0

    @anzahl = false

    mail :to=> @email,

         :subject=> "Ihre Bestellung"

  end



  def booking_new(person, articles, card)

    @person = person

    @articles = articles

    @card = card

    @sum = 0.0

    @anzahl = false

    @email = "m.vennewald@schwerte.de"

    mail :to=> @email,

         :subject=> "Neue Bestellung"

  end





end