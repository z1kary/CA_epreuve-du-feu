print "What would you want to say ? "
string = gets.chomp
sl = string.length.to_i
x = 0
stringOut = ""
if sl != x
    loop do
        if string[x] != " "
            if x.even?
                stringOut += string[x].downcase
                x = x.succ
            else
                stringOut += string[x].upcase
                x = x.succ
            end
        else
            stringOut += " "
            x = x.succ
        end
        break if sl == x
    end
end
puts stringOut
