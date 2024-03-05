require_relative '../lib/game'

RSpec.describe Game do
    describe "#initialize" do
        it "creates a new game instance" do
            game = Game.new
            expect(game).to be_an_instance_of(Game)
        end
    end

    describe "#initialize" do
        it "starts the game with an empty board" do
            game = Game.new
            expect(game.board).to eq([[" ", " ", " ", " ", " ", " ", " "],
                                    [" ", " ", " ", " ", " ", " ", " "],
                                    [" ", " ", " ", " ", " ", " ", " "],
                                    [" ", " ", " ", " ", " ", " ", " "],
                                    [" ", " ", " ", " ", " ", " ", " "],
                                    [" ", " ", " ", " ", " ", " ", " "]])
        end
    end
end