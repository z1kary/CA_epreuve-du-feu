print "Choose a number : "

number = gets.chomp.to_i
hashtag = "#"
stair = 0
loop do
    puts (hashtag * stair).rjust(number)
    break if number == stair
    stair = stair + 1
end
