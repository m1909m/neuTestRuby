class NewsMailer < ActionMailer::Base
  default from: 'info@vkm.de'
  def news_email(newsletter, newscontent, abo_newsletter)
    @aboNewsletters = abo_newsletter
    @newsletter = newsletter
    @newscontent = newscontent

      if(@aboNewsletters.enable == true)
        @email = @aboNewsletters.eMail
        @id = @aboNewsletters.id
        @url = "http://vkm.marianit.de/abo_newsletter/" + String(@id)
        mail :to=> @email,
             :subject=> "News-Mail"
      end

      @news = NewsContent.find(@newscontent.id)
      @news.sendStatus = 1
      @news.save
  end
end