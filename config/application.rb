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
      #{Rails.root}/app/models/users
      #{Rails.root}/app/models/achievement
    ]

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
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
  end
end
