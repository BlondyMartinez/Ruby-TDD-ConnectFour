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

    def column_full?(column)
        return false unless (1..7).include?(column)
        @board.none? { |row| row[column - 1] == ' ' } 
    end

    def board_full?
        @board.flatten.none? { |slot| slot == ' ' }
    end

    def first_empty_slot(column)
        @board.reverse_each.with_index do |row, index|
            return (@board.length - 1 - index) if row[column - 1] == ' '
        end
        nil
    end

    def add_move(column, symbol)
        row = column_empty?(column) ? 5 : first_empty_slot(column)
        @board[row][column - 1] = symbol if row
    end

    def winning_combinations
        rows = @board.length
        columns = @board[0].length
        winning_length = 4 
      
        row_indices = (0...rows).to_a
        column_indices = (0...columns).to_a
      
        horizontal = row_indices.flat_map do |row|
            column_indices.each_cons(winning_length).map { |column_chunk| column_chunk.map { |col| [row, col] } }
        end
      
        vertical = column_indices.flat_map do |column|
            row_indices.each_cons(winning_length).map { |row_chunk| row_chunk.map { |r| [r, column] } }
        end
      
        diagonal1 = (0...rows - winning_length + 1).flat_map do |row|
            (0...columns - winning_length + 1).map do |column|
                winning_length.times.map { |i| [row + i, column + i] }
            end
        end
      
        diagonal2 = (0...rows - winning_length + 1).flat_map do |row|
            (0...columns - winning_length + 1).map do |column|
                winning_length.times.map { |i| [row + i, column + winning_length - 1 - i] }
            end
        end
      
        horizontal + vertical + diagonal1 + diagonal2
    end

    def check_winner(symbol)
        winning_combinations.each do |combination|
            symbols = combination.map { |row, col| @board[row][col] }
            return true if symbols.uniq.length == 1 && symbols.first == symbol
        end
        false
    end
end