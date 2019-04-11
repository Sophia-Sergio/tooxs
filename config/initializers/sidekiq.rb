Sidekiq.configure_server do |config|
  config.redis = { host: ENV['TOOXS_REDIS_SIDEQIK_HOST'], port: ENV['TOOXS_REDIS_SIDEQIK_PORT'] }
end

Sidekiq.configure_client do |config|
  config.redis = { host: ENV['TOOXS_REDIS_SIDEQIK_HOST'], port: ENV['TOOXS_REDIS_SIDEQIK_PORT'] }
end