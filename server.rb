require 'sinatra'
require_relative 'tasks'

set :port, 61001

post '/homepage' do
	Tasks.homepage
end

post '/butler' do
	Tasks.butler
end