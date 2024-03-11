require_relative '../lib/game'

RSpec.describe Game do
    describe "#initialize" do
        it "creates a new game instance" do
            game = Game.new
            expect(game).to be_an_instance_of(Game)
        end

        it "starts the game with an empty board" do
            game = Game.new
            expect(game.board.board_state).to eq([[" ", " ", " ", " ", " ", " ", " "],
                                                [" ", " ", " ", " ", " ", " ", " "],
                                                [" ", " ", " ", " ", " ", " ", " "],
                                                [" ", " ", " ", " ", " ", " ", " "],
                                                [" ", " ", " ", " ", " ", " ", " "],
                                                [" ", " ", " ", " ", " ", " ", " "]])
        end
    end

    describe "#player" do 
        it "initializes player1" do
            player1 = Player.new('player1', '●'.green)
            expect(player1.name).to eq('player1')
            expect(player1.symbol).to eq('●'.green)
        end

         
        it "initializes player2" do
            player2 = Player.new('player2', '●'.magenta)
            expect(player2.name).to eq('player2')
            expect(player2.symbol).to eq('●'.magenta)
        end
    end
end