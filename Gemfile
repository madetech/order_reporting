source 'https://rubygems.org'

case ENV['DIST']
when 'solidus'
  gem 'solidus', github: 'solidusio/solidus'
  gem 'solidus_auth_devise', '~> 1.0'
  gemspec name: 'solidus_order_reporting'
when 'spree'
  gem 'spree', github: 'spree/spree', branch: '2-4-stable'
  gem 'spree_auth_devise', github: 'spree/spree_auth_devise', branch: '2-4-stable'
  gemspec name: 'spree_order_reporting'
else
  raise 'Please specify DIST as solidus or spree'
end
