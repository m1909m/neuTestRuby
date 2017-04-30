class NewsMailer < ActionMailer::Base
  default from: 'info@vkm.de'
  def news_email(newsletter, newscontent)
    @aboNewsletters = AboNewsletter.all
    @newsletter = newsletter
    @newscontent = newscontent

      if(@aboNewsletters.enable == true)
        @email = @aboNewsletters.eMail
        @id = @aboNewsletters.id
        @url = "http://vkm.marianit.de/abo_newsletter/" + String(@id)
        mail :to=> @email,
             :subject=> "Newsletter VKM-RWL"
      end

      @news = NewsContent.find(@newscontent.id)
      @news.sendStatus = true
      @news.save
  end
end