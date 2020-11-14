print "Choose a number : "

number = gets.chomp.to_i
hashtag = "#"
stair = 0
loop do
    puts (hashtag * stair).rjust(number.to_i)
    break if(number == stair)
    stair = stair + 1
end
