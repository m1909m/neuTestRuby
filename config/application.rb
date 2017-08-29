
require_relative 'boot'


require 'rails/all'





require 'csv'





# Require the gems listed in Gemfile, including any gems

# you've limited to :test, :development, or :production.

Bundler.require(*Rails.groups)



module NeuTestRuby

  class Application < Rails::Application


    config.assets.paths << Rails.root.join('vendor', 'assets', 'bower_components')

    config.assets.paths << Rails.root.join('vendor', 'assets', 'bower_components', 'bootstrap')

    config.assets.paths << Rails.root.join("vendor","assets", "fonts")

    config.assets.paths << Rails.root.join("vendor","assets", "stylesheets")

    # Settings in config/environments/* take precedence over those specified here.

    # Application configuration should go into files in config/initializers

    # -- all .rb files in that directory are automatically loaded.

    config.generators do |g|

      g.fixture_replacement :factory_girl

      g.view_specs false

      g.controller_specs false

      g.helper_specs false

      g.assets true

    end

  end

end

