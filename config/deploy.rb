# config valid only for current version of Capistrano
lock "3.9.0"

set :application, "salesforce-reporter"
set :repo_url, "git@gitlab.com:mta-corp/salesForce-reporter.git"
set :rails_env, "production"
set :db_local_clean, true
set :disallow_pushing, true
set :deploy_to, '/home/deploy/apps/salesforce'
append :linked_dirs, "log", "tmp/pids", "tmp/cache", "tmp/sockets", "node_modules", 'public/uploads'

after 'deploy:publishing', 'deploy:restart'

namespace :deploy do
  desc 'Restart unicorn <3'
  task :restart do
    on roles(:app) do
      sudo :service, :unicorn_salesforce, :upgrade
    end
  end
end
