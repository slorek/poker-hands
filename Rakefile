require 'rake'

require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new(:spec)

task :default => :spec

require 'cucumber/rake/task'
Cucumber::Rake::Task.new(:features)
