require 'sinatra'
require_relative 'tasks/index'


post '/homepage' do
	Tasks.homepage
end