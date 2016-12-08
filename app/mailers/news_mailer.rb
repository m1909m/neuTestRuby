class NewsMailer < ActionMailer::Base
  default from: 'marian.vennewald@gds-medien.de'
  def news_email(newsletter, abo_newsletter)
    @aboNewsletters = abo_newsletter
    @newsletter = newsletter

      if(@aboNewsletters.enable == true)
        @fromV = @newsletter.from
        @email = @aboNewsletters.eMail
        mail :from=> @fromV,
             :to=> @email,
             :subject=> "News-Mail"
      end


  end
end