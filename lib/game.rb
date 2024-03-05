require_relative 'board'
require_relative 'player'
require_relative 'color'

class Game 
    attr_reader :board, :player1, :player2

    def initialize
        @board = Board.new
        @board.display
        @player1 = Player.new('player1', '●'.green)
        @player2 = Player.new('player2', '●'.magenta)
    end
end