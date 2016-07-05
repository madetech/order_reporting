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
  when 'Gemfile.spree.rb'
    ENV['LIB_NAME'] = 'spree_order_reporting'
  when 'Gemfile.solidus.rb'
    ENV['LIB_NAME'] = 'solidus_order_reporting'
  end
  Rake::Task['extension:test_app'].invoke
end
