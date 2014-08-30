# json2csv

Simple tool for converting JSON to CSV

## Status

[![Gem Version](https://badge.fury.io/rb/json2csv.svg)](http://badge.fury.io/rb/json2csv)
[![Build Status](https://travis-ci.org/korczis/json2csv.svg)](https://travis-ci.org/korczis/json2csv)
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


**Input json**

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
                "note": "Pool available"
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
                "note": "Korean Deli near to main entrance"
            }
        }
    }
}
```

**Convert json**

```
./bin/json2csv convert data/sample.json
Converting data/sample.json

```

**Output json**

```
cat data/sample.json.csv

id,Firstname,Lastname,Address.Street,Address.City,Address.Details.note
12345,Joe,Doe,"#2140 Taylor Street, 94133",San Francisco,Pool available
45678,Jack,Plumber,"#111 Sutter St, 94104",San Francisco,Korean Deli near to main entrance

```
