require 'controller'

class Router

	def initialize
		@controller = Controller.new
	end 

	def perform 

		puts "Bienvenue dans The Gossip Project !"

		while true 

			puts "Que veux-tu faire ?"
			puts "1 - Créer un Gossip"
			puts "2- Afficher tous les potins"
			puts "3 - Détruire un potin"
			puts "4 - Quitter l'app"
			choice = gets.chomp.to_i

			case choice
			when 1 
				puts "Tu as choisi de créer un Gossip"
				@controller.create_gossip

			when 2
				puts "Voici tous les potins :"
				@controller.index_gossips

			when 3 
				puts "Tu as choisi de détruire un potin"
				@controller.destroy_gossip

			when 4
				puts "A bientôt !"
				break

			else 
				puts "Essaie d'entrer une commande valide !"
			end 

		end

	end

end 



