require 'pry'
require './lib/game_board'
require 'csv'

class User 
    attr_reader :game_piece, :game_board
    attr_accessor :name 

    def initialize(game_board)
        @game_piece = 'x'
        @game_board = game_board 
        @name = 'User'
    end

    def select_column
        puts 'Select your column'
        choice = gets.chomp.upcase

        if choice == 'A'
            column = game_board.a_column
        elsif choice == 'B'
            column = game_board.b_column
        elsif choice == 'C'
            column = game_board.c_column
        elsif choice == 'D'
            column = game_board.d_column
        elsif choice == 'E'
            column = game_board.e_column
        elsif choice == 'F'
            column = game_board.f_column
        elsif choice == 'G'
            column = game_board.g_column
        else
            puts 'That is not a valid column choice'
            puts 'Enter A-G only'
            return select_column
        end

        if @game_board.valid_column?(column) == true
            return column
        else
            puts 'There are no spaces left in that column'
            puts 'Please enter a different column choice'
        end 
        select_column
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