require 'bundler'

begin
  require 'spree/testing_support/extension_rake'
  require 'rubocop/rake_task'
  require 'rspec/core/rake_task'

  RSpec::Core::RakeTask.new(:spec)

  RuboCop::RakeTask.new

  task default: %i(first_run rubocop spec)
rescue LoadError
  # no rspec available
end

task :first_run do
  if Dir['spec/dummy'].empty?
    Rake::Task[:test_app].invoke
    Dir.chdir('../../')
  end
end

desc 'Generates a dummy app for testing'
task :test_app do
  case ENV['BUNDLE_GEMFILE']
  when /spree/
    ENV['LIB_NAME'] = 'spree_order_reporting'
  when /solidus/
    ENV['LIB_NAME'] = 'solidus_order_reporting'
  else
    raise 'Specify BUNDLE_GEMFILE'
  end

  Rake::Task['extension:test_app'].invoke
  system 'bundle exec rails g delayed_job:active_record'
  system 'bundle exec rake db:migrate'
end
