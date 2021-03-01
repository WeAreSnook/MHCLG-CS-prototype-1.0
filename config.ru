require 'rubygems'
require 'middleman/rack'
require 'dotenv/load'

protected_middleman = Rack::Auth::Basic.new(Middleman.server) do |username, password|
  [username, password] == [ENV['USERNAME'], ENV['PASSWORD']]
end

run protected_middleman