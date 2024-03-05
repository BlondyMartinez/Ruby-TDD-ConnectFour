class Board 
    attr_reader :board

    def initialize
        @board = Array.new(6) { Array.new(7, ' ') }
    end

    def board_state
        @board
    end

    def display
        puts
        puts '  1   2   3   4   5   6   7'
        @board.each_with_index do |row, index|
            puts "| " + row.join(' | ') + ' |'
            puts '|---|---|---|---|---|---|---|' if index != @board.length - 1
            puts '‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾' if index == @board.length - 1
        end
        puts
    end

end