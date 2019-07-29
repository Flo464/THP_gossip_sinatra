require 'pry'
require 'csv'

class Gossip
	attr_reader :author, :content

	def initialize (author, content)
		@author = author
		@content = content
	end 

	def save 
		CSV.open("db/gossip.csv", "a") do |csv|
  	csv << [@content, @author]
  end 
	end

	def self.all
		all_gossips = []

		CSV.open("db/gossip.csv").each do |ligne|
			temp = Gossip.new(ligne[0], ligne[1])
			all_gossips << temp 
		end 

		return all_gossips
	end 

	def self.destroy(number)
		gossips_array = CSV.read("db/gossip.csv", {col_sep: ","})
		new_array = gossips_array.delete_at(number)
		
		CSV.open('db/gossip.csv', "w") do |csv|
			
			new_array.each do |line|
				csv << line
			end 
		end 
	end 

end 



