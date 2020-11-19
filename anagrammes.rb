if ARGV.length < 2
    puts "#{__FILE__} require two arguments : word_to_find dictionary.txt"
    exit
end

word_to_find = ARGV[0].chars.sort
arg2 = ARGV[1]

sort_dictionary = []
dictionary = []
i = 0

File.foreach(arg2) do |word|
    sort_dictionary[i] = word.chomp.chars.sort
    dictionary[i] = word.chomp
    i += 1
end

i = 0

while i < sort_dictionary.length
    if word_to_find == sort_dictionary[i]
        puts "#{dictionary[i]} est un anagramme de #{ARGV[0]}"
    end
    i += 1
end
