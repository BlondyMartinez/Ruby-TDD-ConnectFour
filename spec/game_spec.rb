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

        it "initializes player1" do
            game = Game.new
            player1 = game.player1
            expect(player1.name).to eq('player1')
            expect(player1.symbol).to eq('●'.green)
        end
    end
end