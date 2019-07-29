
require_relative 'gossip'
require_relative 'view'

class Controller

	def initialize
		@view = View.new
	end 

	def create_gossip
		params = @view.create_gossip
		gossip = Gossip.new(params[:author],params[:content])
		gossip.save
	end 

	def index_gossips
		gossip_array = Gossip.all
		@view.index_gossips(gossip_array)
	end 

	def destroy_gossip
		params = @view.destroy_gossip
		Gossip.destroy (number)
	
	end 

end 

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

end
