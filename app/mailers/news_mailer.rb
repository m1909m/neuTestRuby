class NewsMailer < ActionMailer::Base
  default from: 'info@vkm.de'
  def news_email(newsletter, newscontent, abo_newsletter)
    @newsletter = newsletter
    @newscontent = newscontent
    @abo_newsletter = abo_newsletter
        @email = @abo_newsletter.eMail
        @id = @abo_newsletter.id
        @url = "http://vkm.marianit.de/abo_newsletter/" + String(@id)
        mail :to=> @email,
             :subject=> @newscontent.title



  end
end