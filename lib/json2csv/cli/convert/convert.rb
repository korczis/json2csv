# encoding: UTF-8

require 'csv'
require 'multi_json'
require 'pathname'
require 'pp'

require_relative '../../version'

module Json2Csv
  # Apollon bootstrap module
  module Convert
    class << self
      def convert(paths)
        paths = [paths] unless paths.is_a?(Array)
        paths.each do |path|
          puts "Converting #{path}"

          json = load_file(path)

          process(json, "#{path}.csv")
        end
      end

      def load_file(path)
        # Load input file
        raw = IO.read(path)

        # Try to parse json from loaded data
        begin
          return MultiJson.load(raw)
        rescue Exception => e # rubocop:disable RescueException
          log_exception(e)
        end
        nil
      end

      def log_exception(e)
        puts 'Invalid json, see error.txt'
        File.open('error.txt', 'wt') { |f| f.write(e.to_s) }
      end

      def process(json, out_path = 'out.txt')
        # json = json[json.keys.first]

        keys = json.keys

        first = true # Flag indicating if we already written the "header"

        # Open the CSV for write
        CSV.open(out_path, 'wt') do |csv|
          # Take each story - json['stories'][<ID_HERE>]
          keys.each do |key|
            obj = json[key]

            # Write header if needed
            csv << obj.keys && first = false if first

            # Write row to output CSV
            csv << process_row(obj)
          end
        end
      end

      def process_row(obj)
        # Create empty array containing all values from this object/row
        obj.keys.map do |subkey|
          # Assing value/attribute to temp variable
          tmp = obj[subkey]

          # Make temp variable empty string if null
          tmp = '' if tmp.nil?

          # Remove all new lines - replace them with empty string
          tmp = tmp.gsub(/\n/, '') if tmp.is_a?(String)
          tmp
        end
      end
    end
  end
end
