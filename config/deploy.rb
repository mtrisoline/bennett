require 'capistrano_colors'

set :application,       "beci"
set :repository,        "git@github.com:belighted/beci.git"
set :app_server,        :passenger
set :scm,               :git
set :deploy_via,        :remote_cache
set :branch,            "master"
set :user,              "nja"
set :deploy_to,         "/Users/nja/Sites"
set :rails_env,         "production"


role :web, "192.168.1.99"                          # Your HTTP server, Apache/etc
role :app, "192.168.1.99"                          # This may be the same as your `Web` server
role :db,  "192.168.1.99", :primary => true        # This is where Rails migrations will run


namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end