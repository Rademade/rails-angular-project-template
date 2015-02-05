require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module RailsAngularProjectTemplate
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'

    config.middleware.insert_before(Rack::Sendfile, LightResizer::Middleware, Rails.root)
    config.autoload_paths << "#{Rails.root}/lib/**/*"

    config.assets.paths << "#{config.root}/vendor/assets/bower_components"
    # AngularJS slim templates

    config.angular_templates.module_name    = 'templates'
    config.angular_templates.ignore_prefix  = %w(templates/)
    config.angular_templates.markups        = %w(erb slim)
    config.angular_templates.htmlcompressor = false

  end
end
