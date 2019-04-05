if ENV['REDISTOGO_URL']
  uri = URI.parse(ENV['REDISTOGO_URL'])
  REDIS = Redis.new(url: uri)
else
  REDIS = Redis.new(host: ENV['TOOXS_REDIS_HOST'], port: ENV['TOOXS_REDIS_PORT'])
end
