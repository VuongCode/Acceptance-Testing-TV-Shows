require 'sinatra'
require 'csv'
require_relative "app/models/television_show"

set :views, File.join(File.dirname(__FILE__), "app/views")

get '/television_shows' do
  @television_shows = TelevisionShow.all
  erb :index
end

get '/television_shows/new' do
  @television_show = TelevisionShow.new
  erb :new
end

post '/television_shows/new' do
  @television_show = TelevisionShow.new(params["tv_show"])
  if @television_show.save
    redirect '/television_shows'
  else
    erb :new
  end
end
