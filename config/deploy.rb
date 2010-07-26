require 'mongrel_cluster/recipes'

default_run_options[:pty] = true
set :user, "aybarra"
set :application, "deployment_prac"
set :password, "aA187759!"
set :use_sudo, false

set :mongrel_clean, true

set :deploy_to, "/usr2/aybarra/deployed/#{application}"

set :mongrel_conf, "#{current_path}/config/mongrel_cluster.yml"
#set :repository,  "https://vborges@github.com/vborges/deployment_prac.git"
set :repository, "git@github.com:aybarra/deployment_prac.git"
ssh_options[:paranoid] = false
set :scm, :git

set :scm_username, "vborges"
set :scm_password, "raiders2008_Vero"

set :branch, "master"

ssh_options[:keys] = %w(/usr2/aybarra/.ssh/id_rsa)
#ssh_options[:verbose] = :debug
ssh_options[:forward_agent] = true

set :deploy_via, :remote_cache

role :web, "localhost"     # Your HTTP server, Apache/etc
role :app, "localhost"             # This may be the same as your `Web` server
role :db,  "localhost", :primary => true # This is where Rails migrations will run

namespace :deploy do
  namespace :mongrel do
    [ :stop, :start, :restart ].each do |t|
      desc "#{t.to_s.capitalize} the mongrel appserver"
      task t, :roles => :app do
        #invoke_command checks the use_sudo variable to determine how to run the mongrel_rails command
        invoke_command "mongrel_rails cluster::#{t.to_s} -C #{mongrel_conf}", :via => run_method
      end
    end
  end

  desc "Custom restart task for mongrel cluster"
  task :restart, :roles => :app, :except => { :no_release => true } do
    deploy.mongrel.restart
  end

  desc "Custom start task for mongrel cluster"
  task :start, :roles => :app do
    deploy.mongrel.start
  end

  desc "Custom stop task for mongrel cluster"
  task :stop, :roles => :app do
    deploy.mongrel.stop
  end

end
