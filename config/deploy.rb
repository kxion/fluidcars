require 'rvm/capistrano'
set :rvm_ruby_string, :local
# require 'hoptoad_notifier/capistrano'

set :application, "fluidcars"
set :domain, 'fluidcars.com'
set :user, "root" # 一個伺服器上的帳戶用來放你的應用程式，不需要有sudo權限，但是需要有權限可以讀取Git repository拿到原始碼
set :branch, "master"
set :repository, "root@fluidcars.com:~/git/fluidcars.git"
set :scm, "git"
set :port, "22"

set :deploy_to, "/home/#{domain}"
set :deploy_via, :remote_cache
set :use_sudo, false

role :web, domain
role :app, domain
role :db,  domain, :primary => true

# unicorn.rb 路径
set :unicorn_path, "#{deploy_to}/current/config/unicorn.rb"

namespace :deploy do

  # task :copy_config_files, :roles => [:app] do
  #   db_config = "#{shared_path}/database.yml"
  #   run "cp #{db_config} #{release_path}/config/database.yml"
  # end

  desc "install the necessary prerequisites"
  task :bundle_install, :roles => :app do
    run "cd #{release_path} && RAILS_ENV=production bundle install"
  end

  task :start, :roles => :app do
    run "cd #{deploy_to}/current/; RAILS_ENV=production bundle exec unicorn_rails -c #{unicorn_path} -D"
  end

  task :stop, :roles => :app do
    run "kill -QUIT `cat #{deploy_to}/current/tmp/pids/unicorn.pid`"
  end

  desc "Restart Application"
  task :restart, :roles => :app do
    run "kill -USR2 `cat #{deploy_to}/current/tmp/pids/unicorn.pid`"
  end
end

task :link_shared_files, :roles => :web do
  # run "ln -sf #{deploy_to}/shared/config/*.yml #{deploy_to}/current/config/"
  run "ln -sf #{deploy_to}/current/config/nginx.conf /etc/nginx/nginx.conf"
  # run "ln -sf #{deploy_to}/shared/config/unicorn.rb #{deploy_to}/current/config/"
end

# after "deploy:update_code", "deploy:copy_config_files" # 如果將database.yml放在shared下，請打開
after "deploy:finalize_update", "deploy:bundle_install", :link_shared_files