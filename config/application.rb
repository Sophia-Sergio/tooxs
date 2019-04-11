require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module SalesforceReporter
  class Application < Rails::Application
    config.autoload_paths += %W[
      #{Rails.root}/app/models/staff
      #{Rails.root}/app/models/sale
      #{Rails.root}/app/models/case
      #{Rails.root}/app/models/shift
      #{Rails.root}/app/models/achievement
    ]

    I18n.enforce_available_locales = false

    config.i18n.available_locales = [
      :es,
      :en,
      'es-CL',
      'es-MX',
      'es-CO',
      'pt-BR',
      'es-PE',
      'zh-CN',
    ]

    config.i18n.fallbacks = {
      'es-CL' => 'es',
      'es-MX' => 'es',
      'es-CO' => 'es',
      'es'    => 'en',
      'pt-BR' => 'en',
      'es-PE' => 'es',
      'zh-CN' => 'en',
    }
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1
    config.public_file_server.enabled

    # remove autogenerates active stoeage routes
    initializer(:remove_activestorage_routes, after: :add_routing_paths) do |app|
      app.routes_reloader.paths.delete_if { |path| path =~ /activestorage/ }
    end
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Configuración para envío de correos
    config.action_mailer.default_url_options = { host: ENV['DEFAULT_URL_HOST'] }
    config.action_mailer.delivery_method = :smtp
    config.action_mailer.perform_deliveries = true
    config.action_mailer.raise_delivery_errors = true
    config.action_mailer.default charset: 'utf-8'

    config.action_mailer.smtp_settings = {
      address: ENV['SMTP_EMAIL_ADDRESS'],
      port: ENV['SMTP_EMAIL_PORT'],
      domain: ENV['SMTP_EMAIL_DOMAIN'],
      authentication: ENV['SMTP_EMAIL_AUTH'],
      enable_starttls_auto: ENV['SMTP_EMAIL_STARTTLS'],
      user_name: ENV['SMTP_EMAIL_USERNAME'],
      password: ENV['SMTP_EMAIL_PASSWORD']
    }

  end
end
