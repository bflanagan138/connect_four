require 'rspec'
require './lib/game_board'
require './lib/user'

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
            player1 = User.new(game_board)
            5.times do
                game_board.place_game_piece(game_board.a_column, player1)
            end
            expect(game_board.valid_column?(game_board.a_column)).to eq (true)
            game_board.place_game_piece(game_board.a_column, player1)
            expect(game_board.valid_column?(game_board.a_column)).to eq (false)
        end 
    end 
    describe '#render_game_board' do
        it 'renders game board to terminal' do
            game_board = GameBoard.new()
            expect(game_board.render_game_board).to eq ("ABCDEFG\n.......\n.......\n.......\n.......\n.......\n.......\n")
        end
    end
    describe '#place_game_piece' do 
        it 'places game piece' do 
            game_board = GameBoard.new
            player1 = User.new(game_board)

            game_board.place_game_piece(game_board.a_column, player1)

            expect(game_board.render_game_board).to eq ("ABCDEFG\n.......\n.......\n.......\n.......\n.......\nx......\n")
        end
    end
end