class SendEmailJob < ApplicationJob
  queue_as :default

  def perform(newsletter, newscontent, abo_newsletters)
    @aboNewsletters = abo_newsletters
    @newsletter = newsletter
    @newscontent = newscontent
    @abos = []
    @aboNewsletters.each do |abo_newsletter|
      if(abo_newsletter.enable == true)
        @abos.push(abo_newsletter)
    # Do something later
      end
    end
    NewsMailer.news_email(@newsletter, @newscontent, @abos).deliver
    @news = NewsContent.find(@newscontent.id)
    @news.sendStatus = true
    @news.save
  end
end
