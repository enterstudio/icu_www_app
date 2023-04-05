source "https://rubygems.org"

gem "rake", "12.3.3"
gem "rails", "6.1.7.3"
gem "sprockets", "4.2.0" # Latest version of sprockets 2.*. 3.* causes a failure at startup
gem "mysql2"
gem "haml-rails", ">= 1.0.0"
gem "sass-rails", "~> 6.0", ">= 6.0.0"
gem "uglifier", ">= 2.7.2"
gem "jquery-rails", ">= 4.4.0"
gem "cancan", "~> 1.6"
gem "redis"
gem "therubyracer", platforms: :ruby
gem "icu_name"
gem "icu_utils", "1.3.1", git: 'https://github.com/ninkibah/icu_utils.git'
gem "redcarpet", ">= 3.5.1"
gem "stripe", ">= 1.36.1"
gem "mailgun-ruby", ">= 1.1.1", require: "mailgun"
gem "paperclip", "~> 5.2", ">= 5.2.1"
gem "colored"
gem "whenever", :require => false
gem "quiet_assets"

group :development do
  gem "capistrano-rails", "~> 1.1", ">= 1.1.2"
  gem "wirble"
end

group :development, :test do
  gem "rspec-rails", "~> 3.5", ">= 3.5.0"
  gem "capybara"
  gem "selenium-webdriver"
  gem "chromedriver-helper"
  gem "factory_girl_rails", "~> 4.5", ">= 4.5.0", require: false
  gem "launchy"
  gem "faker"
  gem "database_cleaner"
  #gem "byebug"
end
