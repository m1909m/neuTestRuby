
class BookingMailer < ActionMailer::Base
  default from: 'info@vkm.de'
  def booking_email(person, articles, card)
    @person = person
    @articles = articles
    @card = card
    @email = person.email
    mail :to=> @email,
         :subject=> "Ihre Bestellung"
  end
  def booking_new(person, articles, card)
    @person = person
    @articles = articles
    @card = card
    @email = "verbandkirchlichermmitarbeiter@gmail.com"
    mail :to=> @email,
         :subject=> "Neue Bestellung"
  end

end