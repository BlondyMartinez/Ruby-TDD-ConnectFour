class Board 
    attr_accessor :board

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


    def column_empty?(column) 
        @board.all? { |row| row[column - 1] == ' ' }
    end

    def first_empty_slot(column)
        @board.reverse_each.with_index do |row, index|
            return (@board.length - 1 - index) if row[column - 1] == ' '
        end
        nil
    end
end