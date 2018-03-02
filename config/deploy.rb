# -*- encoding : utf-8 -*-
begin
  require 'bundler/capistrano'
rescue LoadError
  puts "You're missing the bundler gem: gem install bundler"
  exit 1
end


#-------------------------------------
# SETTINGS
#-------------------------------------

set :application,    "tmwsd"
set :repository,     "git@github.com:brandonarbini/tmwsd2.git"
set :user,           "deploy"
set :deploy_via,     :remote_cache
set :scm,            :git
set :use_sudo,       false
set :keep_releases,  5
set :deploy_to,      "/data/#{application}"
set :branch,         "production"
set :rails_env,      "production"
set :public_children, %w(stylesheets javascripts)
server "69.16.194.171", :web, :app, :db, :primary => true


#-------------------------------------
# DEPLOY
#-------------------------------------

after "deploy:symlink", "deploy:cleanup"
namespace :deploy do
  desc "Restart passenger by touching restart.txt"
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "touch #{current_path}/tmp/restart.txt"
  end

  after "deploy:update_code", "deploy:symlink_configs"
  task :symlink_configs, :roles => :app, :except => { :no_release => true, :no_symlink => true } do
    run <<-CMD
      cd #{release_path} &&
      ln -nfs #{shared_path}/config/database.yml #{release_path}/config/database.yml &&
      ln -nfs #{shared_path}/config/application.yml #{release_path}/config/application.yml
    CMD
  end
end
