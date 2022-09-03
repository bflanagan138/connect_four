require 'pry'

class CheckWinner
    attr_reader :game_board, :player 

    def initialize(player, game_board)
        @player = player 
        @game_board = game_board
    end 

    def check_row
        6.times do |i|   
            row = ''    
            @game_board.columns.each do |column|
                row.concat(column[i])
            end
            if row.include?('xxxx') || row.include?('oooo') 
                return true
            end
        end 
    end

    def check_column
        @game_board.columns.each do |column|
            if column.join.include?('xxxx') || column.join.include?('oooo')
                return true 
            end 
        end
    end

    def check_diagonal
        columns_to_test = @game_board.columns.find_all do |column|
            column[3..5].include?(@player.game_piece)
        end
        columns_to_test.each do |column|
            if @game_board.columns[0..3].include?(column)
                column[3..5].each_with_index do |row, index|
                    
                    diagonal = []
                    diagonal << row
                    3.times do |i|
                       
                        column_index = @game_board.columns.index(column) + i + 1
                        row_index = 3 + index - (i + 1)
                       
                        diagonal << (@game_board.columns[column_index][row_index]) 
                    end
                    return true if diagonal.join.include?("xxxx") || diagonal.join.include?("oooo")
                end
            end
            
            if @game_board.columns[3..6].include?(column)
                column[3..5].each_with_index do |row, index|
                    diagonal = []
                    diagonal << row
                    3.times do |i|
                        
                        column_index = @game_board.columns.index(column) - i - 1
                        row_index = 3 + index - (i + 1)
                        diagonal << (@game_board.columns[column_index][row_index]) 
                       
                    end
                    return true if diagonal.join.include?("xxxx") || diagonal.join.include?("oooo")
                end
            end
        end
        false
    end
end

