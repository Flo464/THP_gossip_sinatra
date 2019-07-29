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




