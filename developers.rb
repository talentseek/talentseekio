require 'dm-core'
require 'dm-migrations'

DataMapper.setup(:default, "sqlite3://#{Dir.pwd}/development.db")

class Developer
 include DataMapper::Resource
 property :id, Serial
 property :name, String
 property :jobtitle, String
 property :description, Text	
 property :skill, String
end
DataMapper.finalize

get '/developers' do
	@developers = Developer.all
	erb :developers
	end

get '/developers/new' do
 @developer = Developer.new
 erb :new_developer
end

get '/developers/:id/edit' do
 @developer = Developer.get(params[:id])
 erb :edit_developer
end

put '/developers/:id' do
 developer = Developer.get(params[:id])
 developer.update(params[:developer])
 redirect to("/developers/#{developer.id}")
end

post '/developers' do
 developer = Developer.create(params[:developer])
 redirect to("/developers/#{developer.id}")
end

get '/developers/:id' do
 @developer = Developer.get(params[:id])
 erb :show_developer
end

