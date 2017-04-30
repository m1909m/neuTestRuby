class SendEmailJob < ApplicationJob
  queue_as :default

  def perform(newsletter, newscontent)
    @newsletter = newsletter
    @newscontent = newscontent
    NewsMailer.news_email(@newsletter, @newscontent).deliver_later
    # Do something later
  end
end
