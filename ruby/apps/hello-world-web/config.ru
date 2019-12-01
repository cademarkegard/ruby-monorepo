# frozen_string_literal: true

require 'bundler/setup'
Bundler.require(:default)

root_dir = File.dirname(__FILE__)
lib_path = root_dir + '/app'
env      = ENV.fetch('RACK_ENV', 'development').to_sym
app_file = File.join(root_dir, 'app', 'sinatra_application.rb')

$LOAD_PATH << lib_path if File.exist?(lib_path) && !$LOAD_PATH.include?(lib_path)

require 'controller'

# @formatter:off
set :environment,   env
set :root,          root_dir
set :app_file,      app_file
# @formatter:on

disable :run

log = File.new("log/.log", 'a+')

$stdout.reopen(log)
$stderr.reopen(log)

run Sinatra::Application
