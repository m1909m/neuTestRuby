class NewsMailer < ActionMailer::Base

  default from: 'news@vkm-rwl.de'

  def news_email(newsletter, newscontent, abo_newsletter)

    @newsletter = newsletter

    @newscontent = newscontent

    @newsletter.newsBody = @newsletter.newsBody.gsub('CONTENT', @newscontent.content)


    abo_newsletter.each { |abo|

        @url = "https://vkm.marianit.de/abo_newsletter/" + String(abo.id)

        mail :to=> abo.eMail,

             :subject=> @newscontent.title,

              :content_type => "text/html"

    }

  end

  def news_email_only(newsletter, newscontent, abo)

    @newsletter = newsletter

    @newscontent = newscontent

    @newsletter.newsBody = @newsletter.newsBody.gsub('CONTENT', @newscontent.content)


    @url = "https://vkm.marianit.de/abo_newsletter/" + String(abo.id)

    mail :to=> abo.eMail,

         :subject=> @newscontent.title,

         :content_type => "text/html"

  end

  def anmelden_email(abo_newsletter)

    @abo_newsletter = abo_newsletter

    @url = "https://vkm.marianit.de/newsletter/" + @abo_newsletter.id.to_s

    mail :to=> @abo_newsletter.eMail,

         :subject=> "Anmeldung für den vkm-rwl Newsletter",

         :content_type => "text/html"

  end

  def abmelden_email(abo_newsletter)
    @abo_newsletter = abo_newsletter

    @url = "https://vkm.marianit.de/abo_newsletter/" + @abo_newsletter.id.to_s

    mail :to=> @abo_newsletter.eMail,

         :subject=> "Abmeldung für den Newsletter",

         :content_type => "text/html"
  end

end