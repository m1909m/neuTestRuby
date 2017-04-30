class NewsMailer < ActionMailer::Base
  default from: 'info@vkm.de'
  def news_email(newsletter, newscontent)
    @aboNewsletters = AboNewsletter.all
    @newsletter = newsletter
    @newscontent = newscontent
    @abo_newsletters.each do |abo_newsletter|
      if(abo_newsletter.enable == true)
        @email = abo_newsletter.eMail
        @id = abo_newsletter.id
        @url = "http://vkm.marianit.de/abo_newsletter/" + String(@id)
        mail :to=> @email,
             :subject=> @newscontent.title
      end
    end

      @news = NewsContent.find(@newscontent.id)
      @news.sendStatus = true
      @news.save
  end
end