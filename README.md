# json2csv

Easy to use tool for converting JSON to CSV

## Status

[![Gem Version](https://badge.fury.io/rb/json2csv.svg)](http://badge.fury.io/rb/json2csv)
[![Downloads](http://img.shields.io/gem/dt/json2csv.svg)](http://rubygems.org/gems/json2csv)
[![Build Status](https://travis-ci.org/korczis/json2csv.svg)](https://travis-ci.org/korczis/json2csv)
[![Code Climate](https://codeclimate.com/github/korczis/json2csv/badges/gpa.svg)](https://codeclimate.com/github/korczis/json2csv)
[![Dependency Status](https://gemnasium.com/korczis/json2csv.svg)](https://gemnasium.com/korczis/json2csv)
[![Coverage Status](https://coveralls.io/repos/korczis/json2csv/badge.png)](https://coveralls.io/r/korczis/json2csv)

## Getting started 

```
gem install json2csv
```

## Usage

**Simple conversion**

```
json2csv convert data/sample.json
```

**Global help**

```
json2csv help

NAME
    json2csv - json2csv 0.0.3

SYNOPSIS
    json2csv [global options] command [command options] [arguments...]

GLOBAL OPTIONS
    --help - Show this message

COMMANDS
    convert - Convert json file
    help    - Shows a list of commands or help for one command
    version - Print version info
```

**Convert help**

```
json2csv help convert

NAME
    convert - Convert json file

SYNOPSIS
    json2csv [global options] convert [command options]

COMMAND OPTIONS
    -d, --delimiter=arg - (default: ,)
    -r, --root=arg      - (default: none)
```

## Example


**Input JSON**

```
cat data/sample.json

{
    "12345": {
        "Firstname": "Joe",
        "Lastname": "Doe",
        "Address": {
            "Street": "#2140 Taylor Street, 94133",
            "City": "San Francisco",
            "Details": {
                "Note": "Pool available"
            }
        }
    },

    "45678": {
        "Firstname": "Jack",
        "Lastname": "Plumber",
        "Address": {
            "Street": "#111 Sutter St, 94104",
            "City": "San Francisco",
            "Details": {
                "Note": "Korean Deli near to main entrance"
            }
        }
    }
}
```

**Convert JSON**

```
json2csv convert data/sample.json
Converting data/sample.json

```

**Output CSV**

```
cat data/sample.json.csv

id,Firstname,Lastname,Address.Street,Address.City,Address.Details.Note
12345,Joe,Doe,"#2140 Taylor Street, 94133",San Francisco,Pool available
45678,Jack,Plumber,"#111 Sutter St, 94104",San Francisco,Korean Deli near to main entrance

```

## Contributing to json2csv

- Check out the latest master to make sure the feature hasn't been implemented or the bug hasn't been fixed yet
- Check out the issue tracker to make sure someone already hasn't requested it and/or contributed it
- Fork the project
- Start a feature/bugfix branch
- Commit and push until you are happy with your contribution
- Make sure to add tests for it. This is important so I don't break it in a future version unintentionally.
- Please try not to mess with the Rakefile, version, or history. If you want to have your own version, or is otherwise necessary, that is fine, but please isolate to its own commit so I can cherry-pick around it.

## Copyright

Copyright (c) 2014 Tomas Korcak. See LICENSE for details.
