print "What would you want to say ? "
string = gets.chomp
sl = string.length.to_i
puts sl
x = 0
if(sl != x);then
    d = 0
    u = 1
    loop do
        puts "#{string[d].downcase}#{string[u].upcase}"
        x = x.succ
        u = u + 2
        d = d + 2
        break if(sl == x)
    end
end
