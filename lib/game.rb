require_relative 'board'
require_relative 'player'
require_relative 'color'

class Game 
    attr_reader :board, :player1, :player2, :game_over

    def initialize
        welcome
        @board = Board.new
        @player1 = set_player('green')
        @player2 = set_player('magenta')
        set_initial_variables
        play
    end

    def play 
        @board.display
        until @game_over
            @current_player = @current_player == @player2 ? @player1 : @player2;
            puts "It's #{@current_player.name}'s turn."
            @board.add_move(get_player_move, @current_player.symbol)
            @board.display
            win?(@current_player)
            tie?
        end
        initialize
    end

    def welcome
        puts "Welcome to Connect Four!"
        puts "In this game all you have to do is choose the column you want your dot to be in."
        puts "Whoever has 4 consecutive dots of their color wins."
        puts "Enjoy!"
    end
        
    def set_initial_variables
        @current_player = @player2
        @game_over = false
    end


    def set_player(color)
        puts 'Please enter Player name.'
        name = gets.chomp
        puts "Hello, #{name}! Your color is #{color.send(color)}."
        Player.new(name, '●'.send(color))
    end

    def get_player_move
        puts "Please choose your move! It should be a number between 1 and 7."
        player_move = validate_player_move(gets.chomp.to_i)
    end

    def validate_player_move(input)
        valid = (1..7).include?(input) && !@board.column_full?(input)
        until valid
            valid = (1..7).include?(input) && !@board.column_full?(input)
            break if valid
            puts @board.column_full?(input) ? 'Please choose a different column, that one is full.' : 'Please enter a valid column.'
            input = gets.chomp.to_i
        end
        input
    end

    def win?(current_player)
        if @board.check_winner(current_player.symbol)
            puts "Congratulations, #{current_player.name}! You win!"
            @game_over = true
        end
    end

    def tie?
        if @board.board_full?
            puts "You two tied!"
            @game_over = true
        end
    end
end