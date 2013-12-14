require "bundler/capistrano"

# adjust if youareusing RVM, remove if youarenot
require "rvm/capistrano"
set :rvm_ruby_string, :local

set :application, "fluidcars"
set :domain, 'fluidcars.com'
set :user, "rails" # 一個伺服器上的帳戶用來放你的應用程式，不需要有sudo權限，但是需要有權限可以讀取Git repository拿到原始碼
set :branch, "master"
set :repository, "git@fluidcars.com:/git/fluidcars.git"
set :scm, "git"
set :port, "22"

set :deploy_to, "/home/#{domain}"
set :shared_path, "#{deploy_to}/shared"
set :deploy_via, :remote_cache
set :use_sudo, false

role :web, domain
role :app, domain
role :db,  domain, :primary => true

# unicorn.rb 路径
set :unicorn_path, "#{deploy_to}/current/config/unicorn.rb"

#nginx.conf 路径
set :nginx_path, "/etc/nginx"

namespace :deploy do

  namespace :assets do
    task :precompile, :roles => :web, :except => { :no_release => true } do
      logger.info "Skipping asset pre-compilation"
    end
  end

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
  # run "ln -sf #{deploy_to}/current/config/nginx.conf /etc/nginx/nginx.conf"
  run "ln -sf #{deploy_to}/shared/assets #{deploy_to}/current/public/"
  # run "ln -sf #{deploy_to}/shared/config/unicorn.rb #{deploy_to}/current/config/"
end

task :compile_and_rsync_assets, roles => :web do 
  run_locally "RAILS_ENV=production bundle exec rake assets:precompile; rsync -vr --exclude='.DS_Store' public/assets #{user}@#{domain}:#{shared_path}/"
end

task :compile_assets, :roles => :web do
  run "cd #{deploy_to}/current/; RAILS_ENV=production bundle exec rake assets:precompile"
end

desc "Copy nginx.conf to server"
task :nginx_config, roles => :web do
  run_locally "rsync config/nginx.conf #{user}@#{domain}:#{nginx_path}/"
end
after "deploy:finalize_update", :compile_assets
# after "deploy:update_code", "deploy:copy_config_files" # 如果將database.yml放在shared下，請打開
# after "deploy:finalize_update", "deploy:bundle_install"#, :link_shared_files