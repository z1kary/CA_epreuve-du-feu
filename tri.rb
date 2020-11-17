print "Choose some number : "

to_sort = gets.chomp.split

print "Choose the sort direction ( < or > ): "

case gets.chomp
when "<"
    puts to_sort.sort.join(', ')
when ">"
    puts to_sort.sort.reverse.join(', ')
else
    puts "Invalid action"
end
