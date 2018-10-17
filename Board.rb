#requiert la gem colorize aui permet d'afficher du texte en couleur dans la console
require "colorize"
#definition de la classe Board qui gere l'affichage du plateau de jeu et les conditions de victoires
class Board
	attr_accessor :pos, :pos2, :player1_win, :player2_win, :count
#initialisation des 9 pions avec les valeurs de position numerique, des 2 variables player_win et des 2 tableaux de position(pion simple pour les test , pion coloré pour l'affichage)
	def initialize
		@a = BoardCase.new("0")
		@b = BoardCase.new("1")
		@c = BoardCase.new("2")
		@d = BoardCase.new("3")
		@e = BoardCase.new("4")
		@f = BoardCase.new("5")
		@g = BoardCase.new("6")
		@h = BoardCase.new("7")
		@i = BoardCase.new("8")
		@player1_win = 0
		@player2_win = 0
		@pos = [@a, @b, @c, @d, @e, @f, @g, @h, @i]
		@pos2 = []
		#affichage du plateau
		print_board
	end
	#definition de la ligne qui recoit les pions
	def line(a, b, c)
		puts " " * 3 + "|" + a + "|" + " " * 2 + " ." + " " * 3 + "|" + b + "|" + " " * 2 + " ." + " " * 3 + "|" + c + "" " " * 2
	end
  def line2
		puts "-------------------------"
	end

	#definition du plateau qui affiche les pions en cours
	def print_board
		#.case http://ruby-doc.org/docs/keywords/1.9/Object.html#method-i-case
		line(@pos[0].case, @pos[1].case, @pos[2].case)
		line2
		line(@pos[3].case, @pos[4].case, @pos[5].case)
		line2
		line(@pos[6].case, @pos[7].case, @pos[8].case)
		line2
	end
	#definition des combinaisons gagnantes
	def win_combos
		[[@pos2[0], @pos2[1], @pos2[2]],
		 [@pos2[3], @pos2[4], @pos2[5]],
		 [@pos2[6], @pos2[7], @pos2[8]],
		 [@pos2[0], @pos2[4], @pos2[8]],
		 [@pos2[6], @pos2[4], @pos2[2]],
		 [@pos2[0], @pos2[3], @pos2[6]],
		 [@pos2[1], @pos2[4], @pos2[7]],
		 [@pos2[2], @pos2[5], @pos2[8]]]
	end
	#test si une combinaison gagnante est presente sur le plateau
	def victory?
		win_combos.each do |combos|
	    if combos[0] == "O" && combos[1] == "O" && combos[2] == "O"
	      @player2_win = 1
	    elsif combos[0] == "X" && combos[1] == "X" && combos[2] == "X"
	      @player1_win = 1
	    end
  	end
	end
	#test si tous les pions ont été joués et si c'est le cas renvoie égalité
	def tie?
		@count = 0
		self.pos2.each do |pion|
		  if pion == "O" || pion == "X"
		    @count += 1
		  end
		end
		return @count == 9
	end
end
