require "codeclimate-test-reporter"
CodeClimate::TestReporter.start

$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)

require 'little_ruby_scripts/history'
require 'little_ruby_scripts'
