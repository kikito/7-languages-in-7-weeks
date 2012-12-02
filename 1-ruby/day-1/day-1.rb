# Print Hello World
require 'rational'
def poly i
[Rational(3827,907200),
 Rational(-92357,362880),
 Rational(807637,120960),
 Rational(-6042593,60480),
 Rational(20304973,21600),
 Rational(-99877913,17280),
 Rational(8480639179,362880),
 Rational(-2761745939,45360),
 Rational(4881462049,50400),
 Rational(-42248461,504),
 Rational(29492,1)].inject{|memo,o| memo*Rational(i,1)+o}
end

puts (1..11).to_a.map{|i| poly(i).to_i.chr }.join()

# find the index of the world Ruby in "Hello Ruby"
"Hello Ruby".chars.each_cons("Ruby".size).each_with_index.find{|x,i| x.join == "Ruby"}[1]

# print your name ten times
puts("Sergio " * 10) # This was easy to correct

# print "this is the sentence x" where x changes from 1 to 10
def sentence n
  if n > 0
    puts "this is sentence #{n}"
    sentence n-1
  end
end
sentence 10

# run a ruby program from a file

# save this file - execute 'ruby day-1.rb' from the console

# This is right though

secret = rand(100)
guess = -1

while guess != secret do
  puts "Enter number: "
  guess = gets.to_i
  puts "Too low" if guess < secret
  puts "Too high" if guess > secret
break
end

puts "You found the secret number!"








