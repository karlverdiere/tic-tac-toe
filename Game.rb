#requiert la gem colorize aui permet d'afficher du texte en couleur dans la console
require "colorize"
#definition de la classe Game
class Game
	attr_accessor :player1, :player2
	#initialisation des 2 joueurs
	def initialize
		puts "Entrez le nom du premier joueur"
		@player1 = Player.new(gets.chomp)
		puts "Entrez le nom du premier joueur"
		@player2 = Player.new(gets.chomp)
	end
	#definition d'une partie complete
	def party
		#creation du plateau
		board = Board.new
		#appel de la fonction play
		play(board)
		#test si il y a un gagnant ou égalité
		if board.player1_win == 1
			puts "#{@player1.name} a gagné la partie 1 - 0"
			#appelle la focntion continu_party
			continu_party
		elsif board.player2_win == 1
			puts "#{@player2.name} a gagné la partie 1 - 0"
			continu_party
		elsif board.count == 9
			puts "Egalité"
			continu_party
		end
	end
	#definition d'un tour de jeu pour les 2 joueurs
	def play(board)
		#tant qu'il n'y a pas de gagnant ou d'égalité
		while board.player1_win == 0 && board.player2_win == 0 && board.count != 9
			#appel de la fonction turn
			turn(board, player1, "X", :red)
			#test si le premier joueur n'a pas gagné
			if board.player1_win == 0 && board.player2_win == 0 && board.count != 9
				#appel de la fonction turn
				turn(board, player2, "O", :blue)
			end
		end
	end
	#definition d'un tour pour un joueur avec en parametre le plateau, le joueur, son pion et sa couleur
	def turn(board, player, pion, color)
		#tant que le joueur n'entre pas un nb entre 0 et 8
		begin
			begin
				puts "#{player.name} Entrez la position de votre pion (0 a 8)"
				nb = gets.chomp.to_i
				#https://blog.newrelic.com/engineering/weird-ruby-begin-end/
			end while nb < 0 || nb > 8
		end while board.pos2[nb] == "X" || board.pos2[nb] == "O"
		board.pos[nb].case = pion.colorize(color)
		board.pos2[nb] = pion
		board.print_board
		board.victory?
		board.tie?
	end

	def continu_party
		puts "Voulez vous rejouer ? (pour quittez touchez enter, 1 pour rejouer )"
			continu = gets.chomp.to_i
			if continu == 1
				party
			end
	end
end
