default_run_options[:pty] = true
set :application, "mynight"
set :repository,  "git@github.com:lleger/yeartogo.git"
set :branch, "master"
set :deploy_via, :remote_cache

set :config_files, %w( database.yml )

set :scm, :git
set :scm_username, "lleger"

set :deploy_to, "/var/railsapps/fulfilld"

role :web, "173.230.141.183"                          # Your HTTP server, Apache/etc
role :app, "173.230.141.183"                          # This may be the same as your `Web` server
role :db,  "173.230.141.183", :primary => true # This is where Rails migrations will run

set :use_sudo, false
set :user, 'capistrano'

namespace :deploy do
  desc "Restarting mod_rails with restart.txt"
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "touch #{current_path}/tmp/restart.txt"
    run "ln -nfs #{shared_path}/config/database.yml #{release_path}/config/database.yml" 
		run "chmod -R 777 #{release_path}/public/"
  end

  [:start, :stop].each do |t|
    desc "#{t} task is a no-op with mod_rails"
    task t, :roles => :app do ; end
  end
end