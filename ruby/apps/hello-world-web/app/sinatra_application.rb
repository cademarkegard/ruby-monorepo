# frozen_string_literal: true

require 'rubygems'
require 'sinatra/base'
require 'logger'
require 'haml'
require 'sass'
require 'hello_world'

module App
  class SinatraApplication < Sinatra::Base
    ::Logger.class_eval { alias :write :'<<' }

    class << self
      def root_path
        return @root_path if @root_path && Dir.exist?(@root_paths)

        @root_path ||= ::File.expand_path(__dir__)
      end
    end

    before {
      env["rack.errors"] =  error_logger
    }

    get "/nope" do
      "<a href='http://www.youtube.com/watch?v=75aGG27dGUA'>Nope, nope, nope.</a>"
    end

    get "/yip" do
      "<a href='http://www.youtube.com/watch?v=8d4RtvMQp10'>Yip, yip, yip.</a>"
    end

    get '/' do
      @language = HelloWorld.determine_language(params['l']).to_sym
      @languages = HelloWorld.supported_languages
    end
  end
end
