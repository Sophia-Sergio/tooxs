ruby '2.6.0'
source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'rails', '~> 5.2'

gem 'bcrypt', '~> 3.1.12'
gem 'coffee-rails', '~> 4.2'
gem 'jbuilder', '~> 2.5'
gem 'pg', '~> 0.18'
gem 'puma', '~> 3.7'
gem 'turbolinks', '~> 5'
gem 'uglifier', '>= 1.3.0'

gem 'webpacker', '~> 3.5'
gem 'react-rails', '2.4.7'
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
  gem 'ruby-jmeter'
end

gem 'rubyXL'
gem 'chronic'
gem 'devise'
gem 'faker'
gem 'haml-rails'
gem 'rails-i18n'
gem 'rolify'
gem 'settingslogic'
gem 'simple_form'
gem 'sass-rails', '~> 5.0'
gem 'redis-rails'
gem 'sidekiq'