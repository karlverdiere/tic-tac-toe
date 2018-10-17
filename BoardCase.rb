#definition de la classe Boardcase qui gere les poins avec une variable qui enregistre le pion
class BoardCase
	attr_accessor :case

	def initialize(pion)
		@case = pion
	end
end