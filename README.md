# LittleRubyScripts

This is a collection of scripts and command line utilities for working in a
command line and ruby environment.

Please feel free to add a feature and issue a pull request.

## Installation
Install it yourself as:

    $ gem install little_ruby_scripts

## Usage

### History tools:

This library provides two functions. 

    gen_aliases
    gen_history

- **gen_aliases** will search through a .zhistory file and return a string of
  alias suggestions
- **gen_history** will search though a .zhistory hifle and return a hash of the
  following format
    ```
      {
       command: 'command_name', 
       alias: 'suggested_alias', 
       count:'number_of_times_in_history'
      }
    ```


## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release` to create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

1. Fork it ( https://github.com/[my-github-username]/little_ruby_scripts/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
