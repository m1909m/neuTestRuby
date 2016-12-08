class NewsMailer < ActionMailer::Base
  default from: 'info@vkm.de'
  def news_email(newsletter, abo_newsletter)
    @aboNewsletters = abo_newsletter
    @newsletter = newsletter

      if(@aboNewsletters.enable == true)
        @email = @aboNewsletters.eMail
        mail :to=> @email,
             :subject=> "News-Mail"
      end


  end
end