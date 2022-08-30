class GameBoard 
    attr_reader :a_column, :b_column, :c_column, :d_column, :e_column, :f_column, :g_column
    def initialize
        @a_column = [".", ".", ".", ".", ".", "."]
        @b_column = [".", ".", ".", ".", ".", "."]
        @c_column = [".", ".", ".", ".", ".", "."]
        @d_column = [".", ".", ".", ".", ".", "."]
        @e_column = [".", ".", ".", ".", ".", "."]
        @f_column = [".", ".", ".", ".", ".", "."]
        @g_column = [".", ".", ".", ".", ".", "."]
    end
end
