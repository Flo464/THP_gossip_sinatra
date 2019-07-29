
require_relative 'gossip'

class ApplicationController < Sinatra::Base

  get '/' do
    erb :index
  end

  get '/gossips/new/' do 
  	erb :new_gossip
  end 

 	post '/gossips/new/' do
  	Gossip.new("#{params["gossip_author"]}", "#{params["gossip_content"]}").save
	redirect '/'
	end

	get '/gossips/all/' do
  	erb :gossips, locals: {gossips: Gossip.all}
	end

	get '/:id' do 
		Gossip.find(['id'])
		erb :show_gossip, locals: {id: params[id], found: Gossip.find(id)}
	end 

end
