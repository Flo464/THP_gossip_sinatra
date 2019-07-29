
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

	get 'gossips/:id' do 
		erb :show_gossip, locals: {id: params["gossip_search"], found: Gossip.find(params['gossip_search'].to_i - 1) }
	end 

end
