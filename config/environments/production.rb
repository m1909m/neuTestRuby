Rails.application.configure do

  # Settings specified here will take precedence over those in config/application.rb.



  # Code is not reloaded between requests.

  config.cache_classes = true



  # Eager load code on boot. This eager loads most of Rails and

  # your application in memory, allowing both threaded web servers

  # and those relying on copy on write to perform better.

  # Rake tasks automatically ignore this option for performance.

  config.eager_load = false





  config.active_job.queue_adapter = :delayed_job



  # Full error reports are disabled and caching is turned on.

  config.consider_all_requests_local       = false

  config.action_controller.perform_caching = true



  # Disable serving static files from the `/public` folder by default since

  # Apache or NGINX already handles this.

  config.public_file_server.enabled = true
  config.i18n.default_locale = :de
  



  # Compress JavaScripts and CSS.

  config.assets.js_compressor = :uglifier

  # config.assets.css_compressor = :sass



  # Do not fallback to assets pipeline if a precompiled asset is missed.

  config.assets.compile = true



  # `config.assets.precompile` and `config.assets.version` have moved to config/initializers/assets.rb



  # Enable serving of images, stylesheets, and JavaScripts from an asset server.

  # config.action_controller.asset_host = 'http://assets.example.com'



  # Specifies the header that your server uses for sending files.

  # config.action_dispatch.x_sendfile_header = 'X-Sendfile' # for Apache

  # config.action_dispatch.x_sendfile_header = 'X-Accel-Redirect' # for NGINX



  # Mount Action Cable outside main process or domain

  # config.action_cable.mount_path = nil

  # config.action_cable.url = 'wss://example.com/cable'

  # config.action_cable.allowed_request_origins = [ 'http://example.com', /http:\/\/example.*/ ]
  config.action_controller.default_url_options = {host: 'vkm-rwl.de'}


  # Force all access to the app over SSL, use Strict-Transport-Security, and use secure cookies.

  # config.force_ssl = true



  # Use the lowest log level to ensure availability of diagnostic information

  # when problems arise.

  config.log_level = :info

  config.secret_key = '1e3ade20473412d1366248774792437df0f23a5c7e2459a7502d034e23b9b312260fb9c00e5b56fdbb0d159c55d88725707b931680cf737fbff07509e59882a8'



  # Prepend all log lines with the following tags.

  config.log_tags = [ :request_id ]



  # Use a different cache store in production.

  # config.cache_store = :mem_cache_store



  # Use a real queuing backend for Active Job (and separate queues per environment)

  # config.active_job.queue_adapter     = :resque

  # config.active_job.queue_name_prefix = "neuTestRuby_#{Rails.env}"

  config.action_mailer.perform_caching = false



  # Ignore bad email addresses and do not raise email delivery errors.

  # Set this to true and configure the email server for immediate delivery to raise delivery errors.

  # config.action_mailer.raise_delivery_errors = false



  # Enable locale fallbacks for I18n (makes lookups for any locale fall back to

  # the I18n.default_locale when a translation cannot be found).

  config.i18n.fallbacks = true

  config.encoding = 'utf-8'



  # Send deprecation notices to registered listeners.

  config.active_support.deprecation = :notify



  config.assets.debug = true

  config.assets.paths << Rails.root.join('vendor', 'assets', 'bower_components')

  config.assets.precompile += %w( .svg .eot .woff .ttf )

  # Suppress logger output for asset requests.

  config.assets.quiet = true



  # Use default logging formatter so that PID and timestamp are not suppressed.

  config.log_formatter = ::Logger::Formatter.new



  # Use a different logger for distributed setups.

  # require 'syslog/logger'

  # config.logger = ActiveSupport::TaggedLogging.new(Syslog::Logger.new 'app-name')



  if ENV["RAILS_LOG_TO_STDOUT"].present?

    logger           = ActiveSupport::Logger.new(STDOUT)

    logger.formatter = config.log_formatter

    config.logger = ActiveSupport::TaggedLogging.new(logger)

  end



  # Do not dump schema after migrations.

  config.active_record.dump_schema_after_migration = false

config.action_mailer.delivery_method = :sendmail
config.action_mailer.perform_deliveries = true
config.action_mailer.raise_delivery_errors = true


 # config.action_mailer.delivery_method = :smtp



#  config.action_mailer.smtp_settings = {

 #     :address=> "smtp.gmail.com",

  #    :port=> 587,

   #   :user_name=> 'verbandkirchlichermmitarbeiter@gmail.com',

    #  :password=> 'n6P9rbpu',

     # :domain=> "vkm-rwl-de.prossl.de",

      #:authentication=> "plain",

     # :enable_starttls_auto=> true

 # }



end

