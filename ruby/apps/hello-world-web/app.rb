#!/usr/bin/env ruby
# frozen_string_literal: true

require 'sinatra'
require 'hello_world'

get '/' do
  language = HelloWorld.determine_language(params['l'])
  <<~EOF
    <html>
    <body style="font-family: Corbel, sans-serif; background-color: #FFFFE0;">
    <div style="margin: 100px auto; text-align: center; border: 1px solid #333; border-radius: 10px; width: 500px; box-shadow: 5px 5px 15px 0px #999; background-color: white;">
      <h2>Hello World in #{HelloWorld::HELLO_WORLD.keys.size} Languages</h2>

      <h1 style="margin-bottom: 30px; color: #F70;">#{language ? HelloWorld.hello_world_in(language) : 'Choose Your Language'}</h1>

      <form action="/">
        <select name="l" onchange="submit()">
          <option value=""></option>
          #{HelloWorld::HELLO_WORLD.keys.map { |l| %(<option value="#{l}" #{l == language ? 'selected' : ''}>#{l.to_s.capitalize}</option>) }.join("\n")}
        </select>
      </form>
    </div>
    </body>
    </html>
  EOF
end
