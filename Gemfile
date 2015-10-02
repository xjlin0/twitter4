source 'https://rubygems.org'
ruby '2.1.2'
gem 'rails', '4.2.4'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.1.0'
gem 'jquery-rails'
gem 'turbolinks'
gem 'jbuilder', '~> 2.0'
gem 'bootstrap-sass'
gem 'devise'                #for login
gem 'haml-rails'            #haml
gem 'mysql2'                #official mysql gem?
gem 'acts-as-taggable-on'   #for hashtags of tweet
gem 'acts_as_votable'       # for vote up/down of tweets
group :development do
  gem 'awesome_print'       # to make rails console prettieer
  gem 'rack-mini-profiler'  #for code profiling/buttleneck, must below the pg and mysql gems
  gem 'traceroute'          #finding unused routes
  gem 'bullet'              #find N+1, unused includes or suggest couter cache
  gem 'better_errors'       #looks prettier, frames with console.
  gem 'binding_of_caller', :platforms=>[:mri_21]  #Weihao:
  gem 'html2haml'           #haml
  gem 'quiet_assets'
  gem 'rails_layout'
  gem 'spring-commands-rspec'
end
group :development, :test do
  gem 'byebug'
  gem 'web-console', '~> 2.0'
  gem 'spring'
  gem 'factory_girl_rails'
  gem 'faker'
  gem 'rspec-rails'
  gem "parallel_tests"
end
group :production do
  gem 'puma'
end
group :test do
  gem 'simplecov'            #Test coverage analysis
  gem 'nyan-cat-formatter'
  gem 'capybara'
  gem 'database_cleaner'
  gem 'launchy'
  gem 'selenium-webdriver'
end
