
class View

	def create_gossip

		puts "Quel est ton nom ?"
		author = gets.chomp

		puts "Quel est ton ragot ?"
		content = gets.chomp

		return params = {author: author, content: content}

	end

	def index_gossips (gossips)
		gossips.each do |ligne|
			puts "#{ligne.author}, #{ligne.content}"
		end
	end 

	def destroy (gossip)
		puts "Quel ragot veux-tu détruire ?"
		number = gets.chomp
	end 

end 

