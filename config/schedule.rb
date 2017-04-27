# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
#
# set :output, "/path/to/my/cron_log.log"
#
# every 2.hours do
#   command "/usr/bin/some_great_command"
#   runner "MyModel.some_method"
#   rake "some:great:rake:task"
# end
#
# every 4.days do
#   runner "AnotherModel.prune_old_records"
# end

# Learn more: http://github.com/javan/whenever
every 1.minutes do
  puts(Time.now())
  @newsletters = NewsContent.where(sendStatus: false)
  @newsletters.each do |newsletterContent|
    if newsletterContent.sendTime <= Time.now()
      puts(Time.now())
      @layout = Newsletter.find(newsletterContent.newsletter_id)
      @abo_newsletters = AboNewsletter.where(enable: 1)
      NewsMailer.news_email(@layout, @news_content, @abo_newsletters).deliver
    end

  end

end