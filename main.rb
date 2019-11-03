# devnow.io platform V1 2018

require 'sinatra'
# require './developers'

get '/' do
	#@developers = Developer.all
	erb :home
	end

get '/contact' do
	erb :contact
	end

get '/about' do
	erb :about
	end

not_found do
 erb :not_found
end

