# encoding: UTF-8
$:.push File.expand_path('../lib', __FILE__)
require 'order_reporting/version'

Gem::Specification.new do |s|
  s.name        = 'spree_order_reporting'
  s.version     = OrderReporting::VERSION
  s.summary     = 'Order reports by email for Spree v2.4'
  s.license     = 'MIT'

  s.author    = 'Luke Morton'
  s.email     = 'luke@madetech.com'
  s.homepage  = 'https://github.com/madetech/order_reporting'

  s.files = Dir["{app,config,db,lib}/**/*", 'LICENSE', 'Rakefile', 'README.md']
  s.test_files = Dir['spec/**/*']

  s.add_dependency 'spree_core', '~> 2.4.0'

  s.add_development_dependency 'capybara'
  s.add_development_dependency 'poltergeist'
  s.add_development_dependency 'coffee-rails'
  s.add_development_dependency 'sass-rails'
  s.add_development_dependency 'database_cleaner'
  s.add_development_dependency 'factory_girl'
  s.add_development_dependency 'rspec-rails'
  s.add_development_dependency 'rubocop', '0.37.2'
  s.add_development_dependency 'rubocop-rspec', '1.4.0'
  s.add_development_dependency 'simplecov'
  s.add_development_dependency 'sqlite3'
  s.add_development_dependency 'pry-byebug'
end
