# encoding: UTF-8

require 'csv'
require 'multi_json'
require 'pathname'
require 'pp'

require_relative '../version'

module Json2Csv
  # Apollon bootstrap module
  module Convert
    DEFAULT_OPTIONS = {
      out_path: 'out.txt',
      delimiter: ','
    }

    class << self
      def convert(paths, opts = {})
        paths = [paths] unless paths.is_a?(Array)
        paths.each do |path|
          puts "Converting #{path}"

          json = load_file(path)

          json = json[opts[:root]] if opts[:root]

          tmp_opts = { out_path: "#{path}.csv" }
          process(json, DEFAULT_OPTIONS.merge(opts).merge(tmp_opts))
        end
      end

      def get_keys(obj, prefix = nil)
        keys = obj.keys
        res = keys.map do |key|
          val = obj[key]
          sanitized_key = sanitize_key(key)
          if val.is_a?(Hash)
            full_prefix = prefix ? "#{prefix}.#{sanitized_key}" : sanitized_key
            get_keys(val, full_prefix)
          else
            if prefix && !prefix.nil?
              "#{prefix}.#{sanitized_key}"
            else
              sanitized_key
            end
          end
        end

        res.compact.flatten
      end

      def get_value(obj, path)
        segments = path.split('.')
        segments.each do |segment|
          return nil if obj.nil?
          obj = obj[segment]
        end
        obj
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

      def process(json, opts = DEFAULT_OPTIONS)
        keys = json.keys

        header = nil

        out_path = opts[:out_path]
        csv_opts = {
          col_sep: opts[:delimiter] || DEFAULT_OPTIONS[:delimiter]
        }

        # Open the CSV for write
        CSV.open(out_path, 'wt', csv_opts) do |csv|
          # Take each story - json['stories'][<ID_HERE>]
          keys.each do |key|
            obj = json[key]

            if header.nil?
              header = get_keys(obj)
              csv << ['id'] + header
            end

            # Write row to output CSV
            csv << process_row(obj, key, header)
          end
        end
      end

      def process_row(obj, id, header)
        [id] + header.map do |subkey|
          # Assing value/attribute to temp variable
          tmp = get_value(obj, subkey)

          # Make temp variable empty string if null
          tmp = '' if tmp.nil?

          # Remove all new lines - replace them with empty string
          tmp = tmp.gsub(/\n/, '') if tmp.is_a?(String)
          tmp
        end
      end

      def sanitize_key(key)
        key
      end
    end
  end
end
