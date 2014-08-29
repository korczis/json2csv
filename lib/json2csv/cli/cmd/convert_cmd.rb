# encoding: utf-8

require 'gli'

include GLI::App

require_relative '../shared'
require_relative '../convert/convert'

desc 'Convert json file'
command :convert do |c|
  c.flag [:r, :root], :type => String
  c.flag [:d, :delimiter], :type => String, :default_value => ','

  c.action do |global_options, options, args|
    fail ArgumentError, 'No file to convert specified' if args.empty?

    opts = {}.merge(global_options).merge(options)
    Json2Csv::Convert.convert(args, opts)
  end
end

# default_command :convert
