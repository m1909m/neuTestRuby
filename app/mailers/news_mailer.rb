class NewsMailer < ActionMailer::Base
  default from: 'info@vkm.de'
  def news_email(newsletter, newscontent, abo_newsletter)
    @newsletter = newsletter
    @newscontent = newscontent
    @newsletter.newsBody = @newsletter.newsBody.gsub('CONTENT', @newscontent.content)


    abo_newsletter.each { |abo|
        @url = "http://vkm.marianit.de/abo_newsletter/" + String(abo.id)
        mail :to=> abo.eMail,
             :subject=> @newscontent.title,
              :content_type => "text/html"
    }
  end
  def anmelden_email(abo_newsletter)
    @abo_newsletter = abo_newsletter
    @url = "http://vkm.marianit.de/newsletter/" + @abo_newsletter.id.to_s
    mail :to=> @abo_newsletter.eMail,
         :subject=> "Anmeldung für den vkm-rwl Newsletter",
         :content_type => "text/html"
  end
end