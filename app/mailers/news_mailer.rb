class NewsMailer < ActionMailer::Base
  default from: 'info@vkm.de'
  def news_email(newsletter, newscontent, abo_newsletter)
    @newsletter = newsletter
    @newscontent = newscontent
    abo_newsletter.each { |abo|
        @url = "http://vkm.marianit.de/abo_newsletter/" + String(abo.id)
        mail :to=> abo.eMail,
             :subject=> @newscontent.title
    }
  end
end