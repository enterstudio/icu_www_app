source "https://rubygems.org"

gem "rake", "10.4.2"
gem "rails", "7.1.0"
gem "sprockets", "4.2.0" # Latest version of sprockets 2.*. 3.* causes a failure at startup
gem "mysql2"
gem "haml-rails", ">= 2.1.0"
gem "sass-rails", "~> 6.0", ">= 6.0.0"
gem "uglifier", ">= 1.3.0"
gem "jquery-rails", ">= 4.1.1"
gem "cancan", "~> 1.6"
gem "redis"
gem "therubyracer", platforms: :ruby
gem "icu_name"
gem "icu_utils", "1.3.1", git: 'https://github.com/ninkibah/icu_utils.git'
gem "redcarpet"
gem "stripe"
gem "mailgun-ruby", require: "mailgun"
gem "paperclip", "~> 4.2", ">= 4.2.2"
gem "colored"
gem "whenever", :require => false
gem "quiet_assets"

group :development do
  gem "capistrano-rails", "~> 1.1", ">= 1.1.3"
  gem "wirble"
end

group :development, :test do
  gem "rspec-rails", "~> 3.5", ">= 3.5.0"
  gem "capybara", ">= 2.5.0"
  gem "selenium-webdriver", ">= 2.46.1"
  gem "chromedriver-helper", ">= 1.1.0"
  gem "factory_girl_rails", "~> 4.6", ">= 4.6.0", require: false
  gem "launchy"
  gem "faker"
  gem "database_cleaner"
  #gem "byebug"
end
