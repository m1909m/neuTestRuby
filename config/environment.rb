# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!
ActionMailer::Base.smtp_settings = {
    :user_name => 'admin',
    :password => 'admin1234',
    :domain => 'vkm.marianit.de',
    :address => 'smtp.marianit.de',
    :port => 587,
    :authentication => :plain,
    :enable_starttls_auto => true
}