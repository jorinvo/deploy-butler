require 'sinatra'
require_relative 'tasks/index'

set :port, 61001

post '/homepage' do
	Tasks.homepage
end