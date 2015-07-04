[![Build Status](https://travis-ci.org/whatisinternet/little_ruby_scripts.svg?branch=master)](https://travis-ci.org/whatisinternet/little_ruby_scripts)
[![Gem Version](https://badge.fury.io/rb/little_ruby_scripts.svg)](http://badge.fury.io/rb/little_ruby_scripts)
[![Code Climate](https://codeclimate.com/github/whatisinternet/little_ruby_scripts/badges/gpa.svg)](https://codeclimate.com/github/whatisinternet/little_ruby_scripts)
[![Test Coverage](https://codeclimate.com/github/whatisinternet/little_ruby_scripts/badges/coverage.svg)](https://codeclimate.com/github/whatisinternet/little_ruby_scripts)
# LittleRubyScripts

This is a collection of scripts and command line utilities for working in a
command line and ruby environment.


This is a work in progress. More scripts may be added as needed. Please feel 
free to add a feature and issue a pull request.

## Installation
Install it yourself as:

    $ gem install little_ruby_scripts

## Usage

### History tools:

This library provides three functions. 

    galiases
    ghistory
    imeant

- **galiases** will search through a .zhistory file and return a string of
  alias suggestions
- **ghistory** will search though a .zhistory hifle and return a hash of the
  following format
    ```
      {command: 'command_name', 
       alias: 'suggested_alias', 
       count:'number_of_times_in_history'}
    ```
- **imeant** will search through .zhistory for the last used 'command' and return what you probably meant

## Contributing

1. Fork it ( https://github.com/whatisinternet/little_ruby_scripts/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
