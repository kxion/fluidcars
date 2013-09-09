# source 'http://ruby.taobao.org'
source 'https://rubygems.org'

gem 'rails', '4.0.0'
gem 'sass-rails', "~> 4.0.0"
gem 'coffee-rails', "~> 4.0.0"
gem 'uglifier', '>= 1.3.0'
gem "jquery-rails", "2.0.1"

# 分页
# gem 'will_paginate'
# gem 'will_paginate_mongoid'
# gem 'bootstrap-will_paginate'
gem 'kaminari'
# Bootstrap
gem 'anjlab-bootstrap-rails', '>= 3.0.0.0', :require => 'bootstrap-rails'

# 上传组件
gem 'carrierwave'
gem 'carrierwave-upyun'
gem 'carrierwave-mongoid', git: "git://github.com/jnicklas/carrierwave-mongoid.git"
gem "mongoid-grid_fs", github: "ahoward/mongoid-grid_fs", branch: "master"

# 第三方认证
gem 'omniauth-identity'

# 分享功能
gem "social-share-button", '0.1.4'

# 表单
gem 'simple_form', git: 'https://github.com/plataformatec/simple_form'

# Mongoid 辅助插件
gem 'bson_ext'
gem 'mongoid', git: 'https://github.com/mongoid/mongoid.git'

# 口令加密
gem 'bcrypt-ruby', '~> 3.0.0'


group :development, :test do
  gem 'capistrano', '~> 2.15.4', require: false
  gem 'rvm-capistrano', require: false
  gem 'rspec-rails', '~> 2.13.2'
  gem "mongoid_colored_logger", "0.2.2"
  gem 'debugger'
  gem 'factory_girl_rails'
  gem 'database_cleaner'
  gem "rspec-cells", '0.1.7'
  gem "capybara", "~> 0.4.1"
end 

group :production do
  gem 'unicorn'
end

