# json2csv

Simple tool for converting JSON to CSV

## Status

[![Build Status](https://travis-ci.org/korczis/json2csv.svg)](https://travis-ci.org/korczis/json2csv)
[![Coverage Status](https://coveralls.io/repos/korczis/json2csv/badge.png)](https://coveralls.io/r/korczis/json2csv)

## Getting started 

```
gem install json2csv
```

## Usage

```
json2csv convert data/sample.json
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
                "note": "Korean Close close main entrance"
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
45678,Jack,Plumber,"#111 Sutter St, 94104",San Francisco,Korean Close close main entrance

```
