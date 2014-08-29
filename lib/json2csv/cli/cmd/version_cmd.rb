# encoding: utf-8

require 'gli'

include GLI::App

require_relative '../../version'

require_relative '../shared'

desc 'Print version info'
command :version do |c|
  c.action do |_global_options, _options, _args|
    pp Json2Csv::VERSION
  end
end
