require 'rspec'
require './lib/game_board'

RSpec.describe do
    describe "#initialize" do
        it "has an empty column" do
            game_board = GameBoard.new()
            expect(game_board.a_column.all? { |string| string == "." }).to eq (true)
            expect(game_board.b_column.all? { |string| string == "." }).to eq (true)
            expect(game_board.c_column.all? { |string| string == "." }).to eq (true)
            expect(game_board.d_column.all? { |string| string == "." }).to eq (true)
            expect(game_board.e_column.all? { |string| string == "." }).to eq (true)
            expect(game_board.f_column.all? { |string| string == "." }).to eq (true)
            expect(game_board.g_column.all? { |string| string == "." }).to eq (true)
        end
    end 
    describe '#valid_column?' do 
        it 'returns true if column has empty space' do
            game_board = GameBoard.new()
            expect(game_board.valid_column?(game_board.a_column)).to eq(true)
        end 
        it 'returns false if invalid' do 
            game_board = GameBoard.new()
            5.times do
                game_board.drop_piece(game_board.a_column)
            end
            expect(game_board.valid_column?(game_board.a_column)).to eq (true)
            game_board.drop_piece(game_board.a_column)
            expect(game_board.valid_column?(game_board.a_column)).to eq (false)
        end 
    end 
    describe '#render' do
        it 'renders game board to terminal' do
            game_board = GameBoard.new()
            expect(game_board.render).to eq ("ABCDEFG\n.......\n.......\n.......\n.......\n.......\n.......\n")
        end
    end
end