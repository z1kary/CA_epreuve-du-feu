print "Choose a number : "

num = gets.chomp.to_i

def facto(n)
    if n <= 1
        return 1
    end
    return n * facto(n - 1)
end

puts facto(num)