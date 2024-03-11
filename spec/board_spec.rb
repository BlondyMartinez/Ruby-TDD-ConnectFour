require_relative "../lib/board"

# frozen_string_literal: true

describe "Board" do
    describe "#utility" do
        it "the column is empty" do
            board = Board.new
            expect(board.column_empty?(7)).to eq(true)
            expect(board.column_empty?(3)).to eq(true)
        end

        it "the column isnt empty" do
            board = Board.new
            board.board = [[" ", " ", " ", " ", " ", " ", " "],
                        [" ", " ", " ", " ", " ", " ", " "],
                        [" ", " ", " ", " ", " ", " ", " "],
                        [" ", " ", " ", " ", " ", " ", " "],
                        [" ", " ", " ", " ", " ", " ", " "],
                        [" ", " ", " ", "x", " ", " ", "x"]]
            
            expect(board.column_empty?(7)).to eq(false)
            expect(board.column_empty?(4)).to eq(false)
        end

        it "the column is full" do
            board = Board.new
            board.board = [[" ", " ", " ", " ", " ", " ", "x"],
                        [" ", " ", " ", " ", " ", " ", "x"],
                        [" ", " ", " ", " ", " ", " ", "x"],
                        [" ", " ", " ", " ", " ", " ", "x"],
                        [" ", " ", " ", " ", " ", " ", "x"],
                        [" ", " ", " ", "x", " ", " ", "x"]]
            
            expect(board.column_full?(7)).to eq(true)
            expect(board.column_empty?(4)).to eq(false)
        end

        it "the column isnt empty" do
            board = Board.new
            board.board = [["x", " ", " ", " ", " ", " ", " "],
                        ["x", " ", " ", " ", " ", " ", " "],
                        ["x", " ", " ", " ", " ", " ", " "],
                        ["x", " ", " ", "x", " ", " ", " "],
                        ["x", " ", " ", "x", " ", " ", " "],
                        ["x", " ", " ", "x", " ", " ", "x"]]
            
            expect(board.first_empty_slot(7)).to eq(4)
            expect(board.first_empty_slot(4)).to eq(2)
            expect(board.first_empty_slot(2)).to eq(5)
            expect(board.first_empty_slot(1)).to eq(nil)
        end
    end

    describe "#modification" do
        it "play on empty board" do
            board = Board.new
            board.add_move(7, "x")
            expect(board.board_state).to eq([[" ", " ", " ", " ", " ", " ", " "],
                                            [" ", " ", " ", " ", " ", " ", " "],
                                            [" ", " ", " ", " ", " ", " ", " "],
                                            [" ", " ", " ", " ", " ", " ", " "],
                                            [" ", " ", " ", " ", " ", " ", " "],
                                            [" ", " ", " ", " ", " ", " ", "x"]])
        end

        it "play a few times on an empty board" do
            board = Board.new
            board.add_move(7, "x")
            board.add_move(1, "x")
            board.add_move(1, "x")
            board.add_move(1, "x")
            board.add_move(1, "x")
            board.add_move(1, "x")
            board.add_move(1, "x")
            board.add_move(1, "x")
            board.add_move(7, "x")
            board.add_move(3, "x")
            expect(board.board_state).to eq([["x", " ", " ", " ", " ", " ", " "],
                                            ["x", " ", " ", " ", " ", " ", " "],
                                            ["x", " ", " ", " ", " ", " ", " "],
                                            ["x", " ", " ", " ", " ", " ", " "],
                                            ["x", " ", " ", " ", " ", " ", "x"],
                                            ["x", " ", "x", " ", " ", " ", "x"]])
        end
    end

    describe "#win" do
        it "vertical winning combo returns true" do
            board = Board.new
            board.board = [[" ", " ", " ", " ", " ", " ", " "],
                        [" ", " ", " ", " ", " ", " ", " "],
                        [" ", " ", " ", "x", " ", " ", " "],
                        [" ", " ", " ", "x", " ", " ", " "],
                        [" ", " ", " ", "x", " ", " ", " "],
                        [" ", " ", " ", "x", " ", " ", " "]]

            board.check_winner('x');
        end

        it "horizontal winning combo returns true" do
            board = Board.new
            board.board = [[" ", " ", " ", " ", " ", " ", " "],
                        [" ", " ", " ", " ", " ", " ", " "],
                        [" ", " ", "x", "x", "x", "x", " "],
                        [" ", " ", " ", "x", " ", " ", " "],
                        [" ", " ", " ", "x", " ", " ", " "],
                        [" ", " ", " ", " ", " ", " ", " "]]

            expect(board.check_winner('x')).to eq(true)
        end

        it "diagonal winning combo returns true" do
            board = Board.new
            board.board = [[" ", " ", " ", " ", " ", " ", " "],
                        [" ", " ", " ", " ", " ", "x", " "],
                        [" ", " ", "x", "x", "x", " ", " "],
                        [" ", " ", " ", "x", " ", " ", " "],
                        [" ", " ", "x", "x", " ", " ", " "],
                        [" ", " ", " ", " ", " ", " ", " "]]


            expect(board.check_winner('x')).to eq(true)
        end

        it "diagonal winning combo returns true" do
            board = Board.new
            board.board = [[" ", " ", " ", " ", " ", " ", " "],
                        [" ", "x", " ", " ", " ", " ", " "],
                        [" ", " ", "x", "x", " ", " ", " "],
                        [" ", " ", " ", "x", " ", " ", " "],
                        [" ", " ", "x", "x", "x", " ", " "],
                        [" ", " ", " ", " ", " ", " ", " "]]

            expect(board.check_winner('x')).to eq(true)
        end

        it "diagonal winning combo returns true" do
            board = Board.new
            board.board = [[" ", " ", " ", " ", " ", " ", " "],
                        [" ", " ", " ", " ", " ", " ", " "],
                        [" ", " ", "x", "x", " ", "", " "],
                        [" ", " ", " ", "x", " ", " ", " "],
                        [" ", " ", "x", "x", "x", " ", " "],
                        [" ", " ", " ", " ", " ", " ", " "]]

            expect(board.check_winner('x')).to eq(false)
        end
    end
end
