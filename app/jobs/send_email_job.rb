class SendEmailJob < ApplicationJob
  queue_as :default

  def perform(newsletter, newscontent, abo_newsletters)
    @aboNewsletters = abo_newsletters
    @newsletter = newsletter
    @newscontent = newscontent
    @abo_newsletters.each do |abo_newsletter|
      if(abo_newsletter.enable == true)
        NewsMailer.news_email(@newsletter, @newscontent, abo_newsletter).deliver_later
    # Do something later
      end
    end
    @news = NewsContent.find(@newscontent.id)
    @news.sendStatus = true
    @news.save
  end
end
