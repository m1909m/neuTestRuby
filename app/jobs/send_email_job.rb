class SendEmailJob < ApplicationJob

  queue_as :default



  def perform(newsletter, newscontent, abo_newsletters)

    @aboNewsletters = abo_newsletters

    @newsletter = newsletter

    @newscontent = newscontent

    @abos = []

    @aboNewsletters.each do |abo_newsletter|

	
	      NewsMailer.news_email_only(@newsletter, @newscontent, abo_newsletter).deliver

    # Do something later


    end

    

    @news = NewsContent.find(@newscontent.id)

    @news.update_status



  end

end

