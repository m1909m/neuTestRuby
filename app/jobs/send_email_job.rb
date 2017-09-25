class SendEmailJob < ApplicationJob

  queue_as :default



  def perform(newsletter, newscontent)

    @aboNewsletters = AboNewsletter.all

    @newsletter = newsletter

    @newscontent = newscontent

    @abos = []

    @aboNewsletters.each do |abo_newsletter|

      if abo_newsletter.enable == TRUE

        @abos.push(abo_newsletter)
	
	      NewsMailer.news_email_only(@newsletter, @newscontent, abo_newsletter).deliver

    # Do something later

      end

    end

    

    @news = NewsContent.find(@newscontent.id)

    @news.update_status



  end

end

