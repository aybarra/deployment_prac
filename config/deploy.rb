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

#ssh_options[:keys] = %w(/usr2/aybarra/.ssh/id_rsa)
#ssh_options[:verbose] = :debug
#ssh_options[:forward_agent] = true
#ssh_options[:keys] = %w(/Users/user/.ssh/id_rsa)
set :deploy_via, :remote_cache
#set :deploy_via, :copy
role :web, "localhost"     # Your HTTP server, Apache/etc
role :app, "localhost"             # This may be the same as your `Web` server
role :db,  "localhost", :primary => true # This is where Rails migrations will run
#namespace :deploy do
  #%w(start stop restart).each do |action|
    # desc "#{action} the Thin processes"
   # task action.to_sym do
   #    find_and_execute_task("thin:#{action}")
  #  end
 # end
#end

#namespace :thin do
 # %w(start stop restart).each do |action|
 # desc "#{action} the app's Thin Cluster"
   # task action.to_sym, :roles => :app do
  #    run "thin #{action} -c #{deploy_to}/current -C #{deploy_to}/current/config/thin.yml"
 #   end
#  end
#end
