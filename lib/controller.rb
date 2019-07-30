
require_relative 'gossip'

class ApplicationController < Sinatra::Base


  get '/gossips/new/' do 
  	erb :new_gossip
  end 

 	post '/gossips/new/' do
  	Gossip.new("#{params["gossip_author"]}", "#{params["gossip_content"]}").save
	redirect '/'
	end

	get '/' do 
		erb :index, locals: {gossips: Gossip.all}
	end 

	get '/gossips/:id' do 
		erb :show_gossip, locals: {found: Gossip.find(params[:id])}
	end 

end
