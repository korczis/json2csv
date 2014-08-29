# encoding: UTF-8

require 'rubygems'

require 'bundler/setup'
require 'bundler/gem_tasks'

require 'coveralls/rake/task'

require 'rspec/core/rake_task'

Coveralls::RakeTask.new

RSpec::Core::RakeTask.new(:test)

desc 'Run continuous integration test'
task :ci do
  Rake::Task['test:unit'].invoke
  # unless ENV['TRAVIS'] == 'true' && ENV['TRAVIS_SECURE_ENV_VARS'] == 'false'
  #   Rake::Task['test:integration'].invoke
  # end
  Rake::Task['test:cop'].invoke if RUBY_VERSION.start_with?('2.2') == false
  Rake::Task['coveralls:push'].invoke
end

desc 'Run Rubocop'
task :cop do
  exec 'rubocop lib/'
end

namespace :test do
  desc 'Run unit tests'
  RSpec::Core::RakeTask.new(:unit) do |t|
    t.pattern = 'spec/unit/**/*.rb'
  end

  desc "Run coding style tests"
  RSpec::Core::RakeTask.new(:cop) do |t|
    # Rake::Task['cop'].invoke
  end

  task :all => [:unit, :cop]
end

desc 'Get all tasks'
task :tasklist do
  puts Rake.application.tasks
end

task :usage do
  puts 'No rake task specified, use rake -T to list them'
  # puts "No rake task specified so listing them ..."
  # Rake.application['tasklist'].invoke
end
task :default => [:usage]

if $0 == __FILE__
  Rake.application['usage'].invoke
end