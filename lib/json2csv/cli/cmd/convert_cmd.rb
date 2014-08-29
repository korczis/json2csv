# encoding: utf-8

require 'gli'

include GLI::App

require_relative '../shared'
require_relative '../convert/convert'

desc 'Convert json file'
command :convert do |c|
  c.action do |_global_options, _options, args|
    fail ArgumentError, 'No file to convert specified' if args.empty?

    Json2Csv::Convert.convert(args)
  end
end

# default_command :convert
