# encoding: UTF-8

require 'simplecov'
require 'rspec'
require 'coveralls'
require 'pathname'

Coveralls.wear_merged!

# Automagically include all helpers/*_helper.rb

base = Pathname(__FILE__).dirname.expand_path
Dir.glob(base + 'helpers/*_helper.rb').each do |file|
  require file
end

RSpec.configure do |config|
  config.filter_run_excluding :broken => true

  config.before(:all) do
    # TODO: Fully setup global environment
  end

  config.after(:all) do
    # TODO: Fully setup global environment
  end

  config.before(:suite) do
    # TODO: Setup test project
  end

  config.after(:suite) do
    # TODO: Delete test project
  end
end

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter[
  SimpleCov::Formatter::HTMLFormatter,
  Coveralls::SimpleCov::Formatter
]

SimpleCov.start do
  add_filter 'spec/'
end