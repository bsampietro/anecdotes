require "eycap/recipes"
require "erb"
#############################################################
#	Servers
#############################################################

#set :user, "deploy"
set :user, "lokkedc"
set :domain, "68.233.8.4"
#set :domain, "faces.local"
server domain, :app, :web
role :db, domain, :primary => true
set :runner, :user

#############################################################
#	Application
#############################################################

set :application, "1001anecdotes"
set :keep_releases,         5
set :home_dir, "/home/#{user}"
set :deploy_to, "#{home_dir}/apps/#{application}"
#set :dbuser,                "root"
#set :dbpass,                "root"
set :monit_group,           "lokkedc"

#############################################################
#	Settings
#############################################################

# comment out if it gives you trouble. newest net/ssh needs this set.
ssh_options[:keys] = %w(/home/lokkedc/.ssh/id_rsa)
ssh_options[:paranoid] = false
default_run_options[:pty] = true
set :use_sudo, false

#############################################################
#	Git
#############################################################
set :repository,            "git://github.com/james80/st.git"
set :scm_username,          ""
set :scm_password,          ""
set :scm,                   :git
set :branch, "master"
set :scm_passphrase, "lokked09"
set :deploy_via,            :remote_cache
set :repository_cache,      "#{application}_cache"
set :production_database,   "lokkedc_storiesproduction"
set :production_dbhost,     "#{domain}"
set :staging_database,      "stories_development"
set :staging_dbhost,        "faces.local"
set :dbuser,                "lokkedc_lokked"
#set :dbuser,                "lokkedc_lokked"
#set :dbpass,                "jennifer_dbapp"
set :dbpass,                "lokked09"
set :git_enable_submodules, 1

before "deploy:setup", :db
after  "deploy:update", "db:symlink"
after  "deploy:update", "permissions:config_fcgi"

namespace :permissions do
  task :config_fcgi do
    run "for i in `find #{deploy_to}/current/* -type d` ; do chmod -R g-w $i; done"
  end
end
#############################################################
#	DB
#############################################################

namespace :db do
  desc "Create database yaml in shared path" 
  task :default do
    db_config = ERB.new(<<-EOF).result(binding)
    development: &defaults
      adapter: mysql
      timeout: 5000
      database: #{staging_database}
      username: lokkedc
      password: lokked09

    test:
      <<: *defaults
      database: stories_test

    production:
      <<: *defaults
      database: #{production_database}
    EOF

    transaction do
      run "mkdir -p #{shared_path}/config" 
      put db_config, "#{shared_path}/config/database.yml"
      run "mkdir -p #{shared_path}/public/system" 
      put db_config, "#{shared_path}/config/database.yml" 
    end
  end

  desc "Make symlink for database yaml" 
  task :symlink do
    run "ln -nfs #{shared_path}/config/database.yml #{release_path}/config/database.yml" 
    run "ln -s #{shared_path}/public/system #{release_path}/public/system"
  end
end
