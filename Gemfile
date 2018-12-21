ruby '2.4.1'
source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'rails', '~> 5.1.3'

gem 'bcrypt', '~> 3.1.12'
gem 'coffee-rails', '~> 4.2'
gem 'jbuilder', '~> 2.5'
gem 'pg', '~> 0.18'
gem 'puma', '~> 3.7'
gem 'turbolinks', '~> 5'
gem 'uglifier', '>= 1.3.0'

# Use CoffeeScript for .coffee assets and views
# gem 'coffee-rails', '~> 4.2'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
#gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
gem 'bcrypt', '~> 3.1.12'
# Transpile app-like JavaScript. Read more: https://github.com/rails/webpacker
gem 'webpacker', '~> 3.5'
gem 'react-rails'
# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'capybara', '~> 2.13'
  gem 'selenium-webdriver'
  gem 'rspec-rails', '~> 3.5'
  gem 'factory_bot'
  gem 'pry-rails'
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'rails-erd'
  gem 'railroady'
  gem 'seed_dump'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'capistrano'
  gem 'capistrano-rbenv'
  gem 'capistrano-bundler'
  gem 'capistrano-rails'
  gem 'capistrano-db-tasks', require: false
  gem 'faker'
end

gem 'rubyXL'
platforms :ruby do
  gem 'unicorn'
end

gem 'breadcrumbs_on_rails'
gem 'chronic'
gem 'devise'
gem 'haml-rails'
gem 'newrelic_rpm'
gem 'numbers_in_words'
gem 'rails-i18n'
gem 'rolify'
gem 'settingslogic'
gem 'simple_form'
