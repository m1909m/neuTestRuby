class NewsMailer < ActionMMailer::Base
  def news_email(newsletter)
    @aboNewsletter = AboNewsletter.all
    @newsletter = newsletter

    @aboNewsletter.each do |aboNewsletter|
      if(aboNewsletter.enable == true)
        mail (to: aboNewsletter.eMail,
          subject: "News-Mail")
      end
    end

  end
end