
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

end