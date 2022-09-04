require 'csv'

class LeaderBoard
    def initialize
        @file = CSV.open('player_stats.csv', headers: true, header_converters: :symbol)
    end

    def display_leaderboard
        rows = @file.sort_by { |row| 100 - (row[:wins].to_i.to_f/(row[:wins].to_i + row[:losses].to_i) * 100) }


        puts "                   ------======= Leaderboard =======------"
        puts '================================================================================'
        puts ' '
        puts " |Name      |  W  |  L  |   %"
        puts "-+----------+-----+-----+--------------"
        rows.each_with_index do |row, index|
            print "#{index + 1}|"
            print row[0].capitalize.ljust(10)
            print '|  ' + row[1] + '  |  ' + row[2] + '  |  '
            print "#{(row[1].to_i.to_f/(row[1].to_i + row[2].to_i) * 100).round(1)}" unless row[2] == '0'
            print '100.0' if row[2] == '0'
            puts ''
        end
    end

end

leaderboard = LeaderBoard.new
leaderboard.display_leaderboard