require 'pry'
require 'csv'

class Gossip
	attr_accessor :author, :content

	def initialize (author, content)
		@author = author
		@content = content
	end 

	def save 
		CSV.open("./db/gossip.csv", "ab") do |csv|
  	csv << [@content, @author]
  end 
	end

	def self.all
  	all_gossips = []
  	CSV.read("./db/gossip.csv").each do |csv_line|
    	all_gossips << Gossip.new(csv_line[0], csv_line[1])
  	end
  	return all_gossips
	end


	def self.find(id)
		id_gossip = " "
  	CSV.read("./db/gossip.csv").each do |csv_line|
    	if csv_line.index = id 
    		id_gossip = csv_line
    	end 
  	end
  	return id_gossip
  end 

end 




