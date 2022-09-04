require 'pry'
require './lib/game_board'
require 'csv'

class User 
    attr_reader :game_piece, :game_board, :name

    def initialize(game_board, name = 'User')
        @game_piece = 'x'
        @game_board = game_board 
        @name = name 
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
        read_file = CSV.open('./player_stats.csv', headers: true, header_converters: :symbol)

        rows = []
        read_file.each do |row|
            rows << row
        end

        rows << [@name.downcase, '0', '0'] if rows.none? { |row| row[0] == @name.downcase}
        rows.each do |row|        
            if row[0] == @name.downcase
                row[1] = row[1].next if winner == true 
                row[2] = row[2].next if winner == false
            end
        end

        write_file = CSV.open('./player_stats.csv', 'w', write_headers: true, headers: ['name','wins','losses'])
        rows.each { |row| write_file << row }
    end
end 