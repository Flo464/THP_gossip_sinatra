require 'gossip'
require 'view'

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
