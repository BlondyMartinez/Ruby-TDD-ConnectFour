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
end
