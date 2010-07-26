require 'mongrel_cluster/recipes'

default_run_options[:pty] = true
set :user, "aybarra"
set :application, "deployment_prac"
set :password, "aA187759!"
set :use_sudo, false

set :mongrel_clean, true

set :deploy_to, "/usr2/aybarra/deployed/#{application}"

set :mongrel_conf, "#{current_path}/config/mongrel_cluster.yml"
set :repository,  "https://vborges@github.com/vborges/test.git"
ssh_options[:paranoid] = false
set :scm, :git

set :scm_username, "vborges"
set :scm_password, "raiders2008_Vero"

set :branch, "master"

ssh_options[:keys] = %w(/usr2/aybarra/.ssh/id_rsa)
ssh_options[:verbose] = :debug
ssh_options[:forward_agent] = true

set :deploy_via, :remote_cache

role :web, "localhost"     # Your HTTP server, Apache/etc
role :app, "localhost"             # This may be the same as your `Web` server
role :db,  "localhost", :primary => true # This is where Rails migrations will run
