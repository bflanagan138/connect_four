require 'pry'
require './lib/game_board'
require 'csv'

class User
    attr_reader :game_piece, :game_board
    attr_accessor :name, :human

    def initialize(game_board, game_piece, human = true)
        @game_piece = game_piece
        @game_board = game_board 
        @name = 'Player'
        @human = human
    end

    def select_column
        if @human == true
            puts "#{@name} select your column"
            choice = gets.chomp.upcase
        else
            choice = ( ('A'..'G').to_a.sample )
        end

        column_options = {
            'A' => game_board.a_column,
            'B' => game_board.b_column,
            'C' => game_board.c_column,
            'D' => game_board.d_column,
            'E' => game_board.e_column,
            'F' => game_board.f_column,
            'G' => game_board.g_column,
        }

        column = column_options[choice]
        if @game_board.valid_column?(column)
            return column
        else 
            puts 'That is not a valid column choice'
            select_column
        end
    end
     

    def write_stats(winner)
        read_file = CSV.read('./player_stats.csv', headers: true, header_converters: :symbol)

        rows = []
        read_file.each do |row|
            rows << row
        end

        if rows.none? { |row| row[:name] == @name.downcase }
            rows << [@name.downcase, '1', '0'] if winner == true
            rows << [@name.downcase, '1', '0'] if winner == false
        else 
            rows.each do |row|        
                row.to_a
                if row[:name] == @name.downcase
                    row[:wins] = row[:wins].next if winner == true 
                    row[:losses] = row[:losses].next if winner == false
                end
            end
        end
        

        write_file = CSV.open('./player_stats.csv', 'w+', write_headers: true, headers: ['name','wins','losses'])
        
        rows.each { |row| write_file << row }
    end
end 