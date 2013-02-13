require "rvm/capistrano"
require "bundler/capistrano"
load "deploy/assets"

set :application, "story-collab"
set :repository,  "https://github.com/StanfordHCI/story-collab.git"

set :scm, :git # You can set :scm explicitly or Capistrano will make an intelligent guess based on known version control directory names
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`
set :branch, "release"
set :user, "ubuntu"
set :use_sudo, true
set :scm_username, "jojo080889"
ssh_options[:keys] = ["/home/jojo080889/Documents/ServerKeys/jojo0808key.pem"]
ssh_options[:forward_agent] = true
default_run_options[:pty] = true

set :deploy_to, "/var/www/story-collab"
after "deploy", "deploy:migrate"

role :web, "ensemble.stanford.edu"                          # Your HTTP server, Apache/etc
role :app, "ensemble.stanford.edu"                          # This may be the same as your `Web` server
role :db,  "ensemble.stanford.edu", :primary => true # This is where Rails migrations will run
#role :db,  "your slave db-server here"

# if you want to clean up old releases on each deploy uncomment this:
# after "deploy:restart", "deploy:cleanup"

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end