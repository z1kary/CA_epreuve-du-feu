if ARGV.length < 1
    puts "#{__FILE__} require argument : to_solve_sudoku"
    exit
end

sudoku_file = ARGV[0]

sudoku = []
pos = 0
File.foreach(sudoku_file) do |line|
    sudoku[pos] = line.chomp.split('')
    pos += 1
end

def init_array()
    new_array = []
    value = 1
    while value < 10
        new_array[value] = 0
        value += 1
    end
    return new_array
end

def print_sudoku(sudoku)
    line = 0
    while line < sudoku.count
        column = 0
        while column < sudoku[line].count
            print sudoku[line][column]
            column += 1
        end
        print "\n"
        line += 1
    end
end

def check_line(sudoku, line)
    array = init_array()
    column = 0
    while column < sudoku[line].count
        value = sudoku[line][column].to_i
        if value > 0 && value < 10
            array[value] += 1
            if array[value] > 1
                return false
            end
        end
        column += 1
    end
    return true
end

def check_column(sudoku, column)
    array = init_array()
    line = 0
    while line < sudoku[column].count
        value = sudoku[line][column].to_i
        if value > 0 && value < 10
            array[value] += 1
            if array[value] > 1
                return false
            end
        end
        line += 1
    end
    return true
end

def check_square(sudoku, line, column)
    array = init_array()
    square_line = (line / 4) * 4
    square_column = (column / 4) * 4
    line = 0
    while line < square_line + 3
        while column < square_column + 3
            value = sudoku[line][column].to_i
            if value > 0 && value < 10
                array[value] += 1
                if array[value] > 1
                    return false
                end
            end
            column += 1
        end
        line += 1
    end
    return true
end

def solve_sudoku(sudoku)
    line = 0
    while line < sudoku.count
        column = 0
        while column < sudoku[line].count
            if sudoku[line][column] == "_"
                new_value = 1
                while new_value < 10
                    # puts "#{new_value}"                                   | debug
                    sudoku[line][column] = new_value
                    if check_line(sudoku, line) && check_column(sudoku, column) && check_square(sudoku, line, column)
                        sudoku = solve_sudoku(sudoku.map(&:clone))
                        if sudoku != false
                            return sudoku
                        end
                    # elsif check_line(sudoku, line) == false               | debug
                    #     puts "check_line false"                           | debug
                    # elsif check_column(sudoku, column) == false           | debug
                    #     puts "check_column false"                         | debug
                    # elsif check_square(sudoku, line, column) == false     | debug
                    #     puts "check_square false"                         | debug
                    end
                    new_value += 1
                end
                return false
            end
            column += 1
        end
        line += 1
    end
    return sudoku
end

def check_sudoku(sudoku)
    sudoku = solve_sudoku(sudoku)
    if sudoku == false
        puts "Error."
    else
        print_sudoku(sudoku)
    end
end

check_sudoku(sudoku)